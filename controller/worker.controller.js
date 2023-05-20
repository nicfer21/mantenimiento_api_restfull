import WorkerModel from "../models/worker.model.js";

export const getAllWorker = async (req, res) => {
  try {
    const rs = await WorkerModel.findAll({
      order: [["idWorker", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneWorker = async (req, res) => {
  try {
    const rs = await WorkerModel.findOne({
      where: {
        idWorker: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};