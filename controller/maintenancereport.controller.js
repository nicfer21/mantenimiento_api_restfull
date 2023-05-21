import MaintenanceReportModel from "../models/maintenancereport.model.js";

export const getAllMaintenanceReport = async (req, res) => {
  try {
    const rs = await MaintenanceReportModel.findAll({
      order: [["idMaintenanceReport", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneMaintenanceReport = async (req, res) => {
  try {
    const rs = await MaintenanceReportModel.findOne({
      where: {
        idMaintenanceReport: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
