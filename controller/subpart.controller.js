import SubPartModel from "../models/subpart.model.js";

export const getAllSubPart = async (req, res) => {
  try {
    const rs = await SubPartModel.findAll({
      order: [["idSubPart", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneSubPart = async (req, res) => {
  try {
    const rs = await SubPartModel.findOne({
      where: {
        idSubPart: req.params.id,
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
    const rs = await SubPartModel.findAll({
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
