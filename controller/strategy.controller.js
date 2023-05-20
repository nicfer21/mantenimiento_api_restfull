import StrategyModel from "../models/strategy.model.js";

/* Mostrar todos los registros */

export const getAllStrategy = async (req, res) => {
  try {
    const rs = await StrategyModel.findAll({
      order: [["idStrategy", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneStrategy = async (req, res) => {
  try {
    const rs = await StrategyModel.findOne({
      where: {
        idStrategy: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
