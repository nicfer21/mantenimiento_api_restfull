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

export const createMaintenanceRequest = async (req, res) => {
  try {
    const data = {
      title: req.body.title,
      description: req.body.description,
      image: req.file.filename,
      requestDate: req.body.requestDate,
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
