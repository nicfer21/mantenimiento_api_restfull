import TypeElementModel from "../models/typeelement.model.js";

/* Mostrar todos los registros */

export const getAllTypeElement = async (req, res) => {
  try {
    const rs = await TypeElementModel.findAll({
      order: [["idTypeElement", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneTypeElement = async (req, res) => {
  try {
    const rs = await TypeElementModel.findOne({
      where: {
        idTypeElement: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
