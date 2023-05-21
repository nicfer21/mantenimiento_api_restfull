import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const MaintenanceReportModel = db.define(
  "maintenancereport",
  {
    idMaintenanceReport: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    startReport: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    finishReport: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    timeCount: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    observation: {
      type: DataTypes.TEXT("long"),
      allowNull: false,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    idMaintenanceOrder: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "maintenancereport", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default MaintenanceReportModel;
