import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const SupplierModel = db.define(
  "supplier",
  {
    idSupplier: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "supplier", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default SupplierModel;
