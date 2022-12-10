import Users from "../models/UsersModels.js";
import History from "../models/HistoryModels.js";
import jwt from "jsonwebtoken";
//import md5 from "md5";
import jwt_decode from "jwt-decode";
import { response } from "express";

export const getUsers = async (req, res) => {
    try {
        const users = await Users.findAll({
            attributes: ['id', 'email']
        });
        res.json(users);
    } catch (error) {
        console.log(error);
    }
}

export const Register = async (req, res) => {
    const { email, name, password, confPassword } = req.body;
    if (password !== confPassword) return res.status(400).json({ msg: "password dan confirm password tidak cocok" });

    //const hash = md5(email);
    //const pwd = await bcrypt.hashSync(password, 2);
    //const  = await bcrypt.hash(password, salt);

    try {
        await Users.create({
            email: email,
            name: name,
            password: password,
            id_wallet: 0
        });

        res.json({ msg: "Register Berhasil" });
    } catch (error) {
        console.log(error);
    }
}


export const Login = async (req, res) => {
    try {
        const user = await Users.findOne({
            where: {
                email: req.body.email

            }

        });
        var password = req.body.password
        if (password != user.password) return res.status(400).json({ msg: "password salah" });
        const userId = user.id;
        const email = user.email;
        const accessToken = jwt.sign({ userId, email }, process.env.ACCESS_TOKEN_SECRET, {
            expiresIn: '1h'
        });
        const refreshToken = jwt.sign({ userId, email }, process.env.REFRESH_TOKEN_SECRET, {
            expiresIn: '60s'
        });
        await Users.update({ refresh_token: refreshToken }, {
            where: {
                id: userId
            }
        });
        res.cookie('refreshToken', refreshToken, {
            httpOnly: true,
            maxAge: 24 * 60 * 60 * 1000
            //secure:true
        });
        res.json({ accessToken });

    }
    catch (error) {
        res.status(404).json({ msg: "Email tidak ditemukan" });
    }
}
export const Logout = async (req, res) => {
    const refreshToken = req.cookies.refreshToken;
    if (!refreshToken) return res.sendStatus(204);
    const user = await Users.findAll({
        where: {
            refresh_token: refreshToken
        }
    });
    if (!user[0]) return res.sendStatus(204);
    const userId = user[0].id
    await Users.update({ refreshToken: null }, {
        where: {
            id: userId
        }
    });
    res.clearCookie('refreshToken');
    return res.sendStatus(200);
}

export const topUp = async (req, res) => {
    try {
        try {
            let auth = req.headers['authorization']
            const bearer = auth.split(' ')
            const token = bearer[1]
            const dataUser = jwt_decode(token)
            const email = dataUser.email
            console.log(auth)
            console.log(email)
            const users = await Users.findOne({
                where: {
                    email: email
                }
            });
            let saldo = users.saldo
            const jumlah = req.body.jumlah
            saldo = +saldo + +jumlah
            await Users.update({ saldo: saldo }, {
                where: {
                    email: email
                }

            })

            await History.create({
                id_user: users.id,
                id_status: 0,
                amount: jumlah
            });
            const response = ({
                "msg": `saldo anda ${saldo}`
            })
            // res.json(response);
            res.status(200).json(response);
        } catch (error) {
            console.log(error);
        }

    } catch (error) {
        console.log(error.message);
    }
}

export const Uprofile = async (req, res) => {
    try {
        await Users.update(req.body, {
            where: {
                id: req.params.id
            }
        });
        res.status(200).json({ msg: "User Updated" });
    } catch (error) {
        console.log(error.message);
    }
}
export const getSaldo = async (req, res) => {
    try {
        let auth = req.headers['authorization']
        const bearer = auth.split(' ')
        const token = bearer[1]
        const dataUser = jwt_decode(token)
        const email = dataUser.email
        console.log(auth)
        console.log(email)
        const users = await Users.findOne({
            where: {
                email: email
            },
            attributes: ['saldo']
        });
        res.json(users);
    } catch (error) {
        console.log(error);
    }
}
export const getProfile = async (req, res) => {
    try {
        let auth = req.headers['authorization']
        const bearer = auth.split(' ')
        const token = bearer[1]
        const dataUser = jwt_decode(token)
        const email = dataUser.email
        console.log(auth)
        console.log(email)
        const users = await Users.findOne({
            where: {
                email: email
            },
            attributes: ['id', 'email', 'password', 'name', 'saldo']
        });
        res.json(users);
    } catch (error) {
        console.log(error);
    }
}


export const pay = async (req, res) => {
    try {
        try {
            let auth = req.headers['authorization']
            const bearer = auth.split(' ')
            const token = bearer[1]
            const dataUser = jwt_decode(token)
            const email = dataUser.email
            console.log(auth)
            console.log(email)
            const users = await Users.findOne({
                where: {
                    email: email
                }
            });
            let saldo = users.saldo
            const jumlah = req.body.jumlah
            if (jumlah > saldo) {
                res.status(400).send({
                    msg: "saldo anda tidak mencukupi!",
                });
            } else {
                saldo = +saldo - +jumlah
                await Users.update({ saldo: saldo }, {
                    where: {
                        email: email
                    }
                })
                await History.create({
                    id_user: users.id,
                    id_status: 1,
                    amount: jumlah
                });
                const response = ({
                    "msg": `berhasil transaksi, saldo anda sekarang ${saldo}`
                })
                // res.json(response);
                res.status(200).json(response);
            }
        } catch (error) {
            console.log(error);
        }

    } catch (error) {
        console.log(error.message);
    }
}

export const getHistory = async (req, res) => {
    try {
        try {
            let auth = req.headers['authorization']
            const bearer = auth.split(' ')
            const token = bearer[1]
            const dataUser = jwt_decode(token)
            const id_user = dataUser.userId
            console.log(auth)
            console.log(id_user)
            const history = await History.findAll({
                where: {
                    id_user: id_user
                }
            });
            res.send(history)
            let amount = history.amount
            const status = history.id_status
            const response = ({
                "status": status,
                "amount": amount,
                "tanggal": history.createdAt
            })
            // res.status(200).json(response);

        } catch (error) {
            console.log(error);
        }

    } catch (error) {
        console.log(error.message);
    }
}