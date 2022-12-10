import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const { DataTypes } = Sequelize;

const Status = db.define('status', {
    keterangan: {
        type: DataTypes.STRING
    }
}, {
    freezeTablename: true

});
export default Status;