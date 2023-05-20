import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const PlaceModel = db.define(
  "place",
  {
    idPlace: {
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
    tableName: "place", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default PlaceModel;
