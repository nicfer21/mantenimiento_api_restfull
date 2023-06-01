import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const SessionClientModel = db.define(
  "sessionclient",
  {
    idSessionClient: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    datesession: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    idClient: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "sessionclient", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  }
);

export default SessionClientModel;
