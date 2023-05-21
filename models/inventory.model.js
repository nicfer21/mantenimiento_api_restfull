import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const InventoryModel = db.define(
  "inventory",
  {
    idInventory: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    costu: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idCategory: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idManufacturer: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idSupplier: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idTypeElement: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idUnitElement: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "inventory", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default InventoryModel;
