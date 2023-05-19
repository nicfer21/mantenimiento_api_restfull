import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const MachineModel = db.define(
  "machine",
  {
    idMachine: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    brand: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    model: {
      type: DataTypes.STRING,
      allowNull: false,
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
    dataSheet: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    tableName: "machine", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default MachineModel;
