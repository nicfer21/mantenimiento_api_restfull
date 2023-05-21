import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const ClientModel = db.define(
  "client",
  {
    idClient: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement:true,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    pass: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    levelWork: {
      type: DataTypes.TINYINT,
      allowNull: false,
    },
    idWorker: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "client", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default ClientModel;
