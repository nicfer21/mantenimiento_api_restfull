import MaintenanceProcedureModel from "../models/maintenanceprocedure.model.js";
import db from "../database/mantenimiento.db.js";

export const getAllMaintenanceProcedure = async (req, res) => {
  try {
    const rs = await MaintenanceProcedureModel.findAll({
      order: [["idMaintenanceProcedure", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getMaintenanceProcedureByMachine = async (req, res) => {
  try {
    const rs = await db.query(
      `select * from view_maintenanceprocedure_data v where v.idMachine = '${req.params.id}'  ;`
    );
    res.json(rs[0]);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneMaintenanceProcedure = async (req, res) => {
  try {
    const rs = await db.query(
      `select * from view_maintenanceprocedure_data v where v.idMaintenanceProcedure = '${req.params.id}'  ;`
    );
    res.json(rs[0][0]);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
