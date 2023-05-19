import QualityModel from "../models/quality.model.js";

export const getAllQuality = async (req, res) => {
  try {
    const rs = await QualityModel.findAll({
      order: [["idQuality", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneQuality = async (req, res) => {
  try {
    const rs = await QualityModel.findOne({
      where: {
        idQuality: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
