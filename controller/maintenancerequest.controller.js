import MaintenanceRequestModel from "../models/maintenancerequest.model.js";

export const getAllMaintenanceRequest = async (req, res) => {
  try {
    const rs = await MaintenanceRequestModel.findAll({
      order: [["idMaintenanceRequest", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneMaintenanceRequest = async (req, res) => {
  try {
    const rs = await MaintenanceRequestModel.findOne({
      where: {
        idMaintenanceRequest: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
