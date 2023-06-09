import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const PriorityModel = db.define(
  "priority",
  {
    idPriority: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement:true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    color: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "priority", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default PriorityModel;
