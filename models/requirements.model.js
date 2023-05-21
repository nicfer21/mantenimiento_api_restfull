import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const RequirementsModel = db.define(
  "requirements",
  {
    idRequirements: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    cost: {
      type: DataTypes.DECIMAL(10, 3),
      allowNull: false,
    },
    idInventory: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idMaintenanceProcedure: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "requirements", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default RequirementsModel;
