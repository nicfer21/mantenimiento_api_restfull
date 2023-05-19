import PartModel from "../models/part.model.js";

export const getAllPart = async (req, res) => {
  try {
    const rs = await PartModel.findAll({
      order: [["idPart", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOnePart = async (req, res) => {
  try {
    const rs = await PartModel.findOne({
      where: {
        idPart: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getByParent = async (req, res) => {
  try {
    const rs = await PartModel.findAll({
      where: {
        idMachine: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
