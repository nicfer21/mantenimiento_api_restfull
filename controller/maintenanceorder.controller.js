import MaintenanceOrderModel from "../models/maintenanceorder.model.js";

export const getAllMaintenanceOrder = async (req, res) => {
  try {
    const rs = await MaintenanceOrderModel.findAll({
      order: [["idMaintenanceOrder", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneMaintenanceOrder = async (req, res) => {
  try {
    const rs = await MaintenanceOrderModel.findOne({
      where: {
        idMaintenanceOrder: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
