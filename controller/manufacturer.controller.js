import ManufacturerModel from "../models/manufacturer.model.js";

/* Mostrar todos los registros */

export const getAllManufacturer = async (req, res) => {
  try {
    const rs = await ManufacturerModel.findAll({
      order: [["idManufacturer", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneManufacturer = async (req, res) => {
  try {
    const rs = await ManufacturerModel.findOne({
      where: {
        idManufacturer: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
