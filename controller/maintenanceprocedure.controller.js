import MaintenanceProcedureModel from "../models/maintenanceprocedure.model.js";

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

export const getOneMaintenanceProcedure = async (req, res) => {
  try {
    const rs = await MaintenanceProcedureModel.findOne({
      where: {
        idMaintenanceProcedure: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
