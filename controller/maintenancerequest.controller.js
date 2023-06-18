import MaintenanceRequestModel from "../models/maintenancerequest.model.js";
import db from "../database/mantenimiento.db.js";

export const getAllMaintenanceRequest = async (req, res) => {
  try {
    const rs = await MaintenanceRequestModel.findAll({
      order: [
        ["requestState", "ASC"],
        ["requestDate", "DESC"],
      ],
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
    const rs = await db.query(
      `select * from view_maintenancerequest_data where idMaintenanceRequest = ${req.params.id}  ;`
    );
    res.json(rs[0][0]);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const patchStateMaintenanceRequest = async (req, res) => {
  try {
    const { id } = req.params;
    const { requestState } = req.body;
    const rs = await MaintenanceRequestModel.findByPk(id);
    rs.requestState = requestState;
    await rs.save();
    res.json({
      messege: 1,
    });
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const createMaintenanceRequest = async (req, res) => {
  try {
    const data = {
      title: req.body.title,
      description: req.body.description,
      image: req.file.filename,
      requestState: req.body.requestState,
      idWorker: req.body.idWorker,
      idPlace: req.body.idPlace,
      idMachine: req.body.idMachine,
    };

    await MaintenanceRequestModel.create(data);
    res.json({
      messege: 1,
    });
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
