import db from "../database/mantenimiento.db.js";
import { DataTypes } from "sequelize";

const WorkerModel = db.define(
  "worker",
  {
    idWorker: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement:true,
    },
    dni: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    lastname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    firstname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    rate: {
      type: DataTypes.FLOAT,
      allowNull: false,
    },
    state: {
      type: DataTypes.TINYINT,
      allowNull: false,
    },
    idProfesion: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    idWorkType: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "worker", // nombre de la tabla en singular
    timestamps: false, // desactivar los timestamps si no los necesitas
  },
);

export default WorkerModel;
