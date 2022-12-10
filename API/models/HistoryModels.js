import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const { DataTypes } = Sequelize;

const History = db.define('history', {
    id_user: {
        type: DataTypes.STRING
    },

    id_status: {
        type: DataTypes.STRING

    },
    amount: {
        type: DataTypes.STRING
    }
}, {
    freezeTablename: true

});
export default History;