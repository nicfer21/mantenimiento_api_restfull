import UnitElementModel from "../models/unitelement.model.js";

/* Mostrar todos los registros */

export const getAllUnitElement = async (req, res) => {
  try {
    const rs = await UnitElementModel.findAll({
      order: [["idUnitElement", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneUnitElement = async (req, res) => {
  try {
    const rs = await UnitElementModel.findOne({
      where: {
        idUnitElement: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
