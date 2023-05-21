import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const WorkTypeModel = db.define(
  "worktype",
  {
    idWorkType: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement:true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "worktype", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default WorkTypeModel;
