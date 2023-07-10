import MaintenanceOrderModel from "../models/maintenanceorder.model.js";
import db from "../database/mantenimiento.db.js";

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

export const getCalendarMaintenanceOrder = async (req, res) => {
  try {
    const rs = await db.query(
      `select * from view_calendar_data vc where vc.date  = "${req.params.id}";`
    );
    res.json(rs[0]);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const createMaintenanceOrder = async (req, res) => {
  try {
    const rs = await MaintenanceOrderModel.create(req.body);
    res.json({
      messege: 1,
    });
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getMaintenanceOrderForInicio = async (req, res) => {
  try {
    const rs = await db.query(
      `select * from maintenanceorder m 
      inner join view_maintenanceprocedure_data vmd on m.idMaintenanceProcedure = vmd.idMaintenanceProcedure
      where date(convert_tz(m.startOrder,'+00:00', '-05:00')) = "${req.params.date}" AND vmd.idWorker = ${req.params.idWorker};`
    );
    res.json(rs[0]);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getMaintenanceOrderForGraf = async (req, res) => {
  try {
    const rs = await db.query(
      `select * from maintenanceorder m 
      inner join view_maintenanceprocedure_data vmd on m.idMaintenanceProcedure = vmd.idMaintenanceProcedure
      where month(convert_tz(m.startOrder,'+00:00', '-05:00')) = "${req.params.month}" AND
      year(convert_tz(m.startOrder,'+00:00', '-05:00')) = "${req.params.year}";`
    );
    res.json(rs[0]);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
