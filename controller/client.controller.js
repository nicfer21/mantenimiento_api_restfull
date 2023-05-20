import ClientModel from "../models/client.model.js";

export const getAllClient = async (req, res) => {
  try {
    const rs = await ClientModel.findAll({
      order: [["idClient", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneClient = async (req, res) => {
  try {
    const rs = await ClientModel.findOne({
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
