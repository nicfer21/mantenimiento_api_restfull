import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const PartModel = db.define(
  "part",
  {
    idPart: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    idMachine: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "part", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default PartModel;
