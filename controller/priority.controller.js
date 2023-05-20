import PriorityModel from "../models/priority.model.js";

/* Mostrar todos los registros */

export const getAllPriority = async (req, res) => {
  try {
    const rs = await PriorityModel.findAll({
      order: [["idPriority", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOnePriority = async (req, res) => {
  try {
    const rs = await PriorityModel.findOne({
      where: {
        idPriority: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
