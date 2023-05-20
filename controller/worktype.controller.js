import WorkTypeModel from "../models/worktype.model.js";

/* Mostrar todos los registros */

export const getAllWorkType = async (req, res) => {
  try {
    const rs = await WorkTypeModel.findAll({
      order: [["idWorkType", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneWorkType = async (req, res) => {
  try {
    const rs = await WorkTypeModel.findOne({
      where: {
        idWorkType: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
