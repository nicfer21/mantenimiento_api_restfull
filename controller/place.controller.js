import PlaceModel from "../models/place.model.js";

/* Mostrar todos los registros */

export const getAllPlace = async (req, res) => {
  try {
    const rs = await PlaceModel.findAll({
      order: [["idPlace", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOnePlace = async (req, res) => {
  try {
    const rs = await PlaceModel.findOne({
      where: {
        idPlace: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
