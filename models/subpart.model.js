import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const SubPartModel = db.define(
  "subpart",
  {
    idSubPart: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    idPart: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "subpart", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default SubPartModel;
