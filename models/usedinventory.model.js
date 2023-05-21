import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const UsedInventoryModel = db.define(
  "usedinventory",
  {
    idUsedInventory: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement:true,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    cost: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idInventory: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idMaintenanceReport: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "usedinventory", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default UsedInventoryModel;
