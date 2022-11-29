import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const { DataTypes } = Sequelize;

const Users = db.define('users', {
    email: {
        type: DataTypes.STRING
    },

    name: {
        type: DataTypes.STRING

    },
    password: {
        type: DataTypes.STRING
    },
    saldo: {
        type: DataTypes.FLOAT
    },
    id_wallet: {
        type: DataTypes.STRING
    },

    refresh_token: {
        type: DataTypes.TEXT
    }
}, {
    freezeTablename: true

});
export default Users;