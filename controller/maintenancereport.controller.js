import MaintenanceOrderModel from "../models/maintenanceorder.model.js";
import MaintenanceReportModel from "../models/maintenancereport.model.js";
import db from "../database/mantenimiento.db.js";

export const getAllMaintenanceReport = async (req, res) => {
  try {
    const rs = await MaintenanceReportModel.findAll({
      order: [["startReport", "DESC"]],
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
    const rs = await db.query(
      `select * from view_maintenancereport_data where idMaintenanceOrder = ${req.params.id} ;`
    );

    res.json(rs[0][0]);
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
      messege: "1",
    });
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
