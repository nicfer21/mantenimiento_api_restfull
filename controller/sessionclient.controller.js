import SessionClientModel from "../models/sessionclient.model.js";

export const getAllSessionClient = async (req, res) => {
  try {
    const rs = await SessionClientModel.findAll({
      order: [["idSessionClient", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneSessionClient = async (req, res) => {
  try {
    const rs = await SessionClientModel.findOne({
      where: {
        idSessionClient: req.params.id,
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
    const rs = await SessionClientModel.findAll({
      where: {
        idClient: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
