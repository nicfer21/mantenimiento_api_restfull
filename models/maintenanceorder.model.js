import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const MaintenanceOrderModel = db.define(
  "maintenanceorder",
  {
    idMaintenanceOrder: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    description: {
      type: DataTypes.TEXT("long"),
      allowNull: false,
    },
    stepValue: {
      type: DataTypes.TINYINT,
      allowNull: false,
    },
    startOrder: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    finishOrder: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    idMaintenanceProcedure: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idWorker: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idPriority: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "maintenanceorder", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default MaintenanceOrderModel;
