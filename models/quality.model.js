import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const QualityModel = db.define(
  "quality",
  {
    idQuality: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    value: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    dateTest: {
      type: DataTypes.DATE,
      allowNull: false,
    },
  },
  {
    tableName: "quality", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default QualityModel;
