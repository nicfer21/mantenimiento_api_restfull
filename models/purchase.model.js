import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const PurchaseModel = db.define(
  "purchase",
  {
    idPurchase: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement:true,
    },
    purchaseDate: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    observation: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    idInventory: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "purchase", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default PurchaseModel;
