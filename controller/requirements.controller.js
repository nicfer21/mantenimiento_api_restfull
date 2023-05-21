import RequirementsModel from "../models/requirements.model.js";

export const getAllRequirements = async (req, res) => {
  try {
    const rs = await RequirementsModel.findAll({
      order: [["idRequirements", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneRequirements = async (req, res) => {
  try {
    const rs = await RequirementsModel.findOne({
      where: {
        idRequirements: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
