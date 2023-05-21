import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const MaintenanceProcedureModel = db.define(
  "maintenanceprocedure",
  {
    idMaintenanceProcedure: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement:true,
    },
    title: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    workload: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    roadmaps: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    law: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    idStrategy: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idPlace: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idWorker: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "maintenanceprocedure", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default MaintenanceProcedureModel;
