import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const MaintenanceRequestModel = db.define(
  "maintenancerequest",
  {
    idMaintenanceRequest: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    title: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    requestDate: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    requestState: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idWorker: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idPlace: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idMachine: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "maintenancerequest", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  }
);

export default MaintenanceRequestModel;
