import express from "express";
import { getUsers, Register, Login, Logout, topUp, getSaldo, Uprofile, getProfile, pay, getHistory } from "../controllers/Users.js";
import { verifyToken } from "../middleware/VerifyToken.js";
import { refreshToken } from "../controllers/RefreshToken.js";

const router = express.Router();

router.get('/users', verifyToken, getUsers);
router.post('/profile', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.delete('/logout', Logout);
router.get('/profile/saldo/', verifyToken, getSaldo);
router.patch('/profile/saldo/', verifyToken, topUp);
router.get('/profile/saldo/', verifyToken, getSaldo);
router.patch('/profile/', verifyToken, Uprofile);
router.get('/profile/', verifyToken, getProfile);
router.patch('/profile/pay', verifyToken, pay);
router.get('/profile/history', verifyToken, getHistory);
export default router;