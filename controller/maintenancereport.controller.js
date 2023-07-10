import MaintenanceOrderModel from "../models/maintenanceorder.model.js";
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

export const createMaintenanceReport = async (req, res) => {
  try {
    const data = {
      image: req.file.filename,
      startReport: req.body.startReport,
      finishReport: req.body.finishReport,
      timeCount: req.body.timeCount,
      observation: req.body.observation,
      idMaintenanceOrder: req.body.idMaintenanceOrder,
      idMaintenanceReport: req.body.idMaintenanceReport,
    };

    await MaintenanceReportModel.create(data);

    const rs = await MaintenanceOrderModel.findByPk(
      req.body.idMaintenanceOrder
    );
    rs.stepValue = 2;
    await rs.save();

    res.json({
      messege: "creado reporte",
    });
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
