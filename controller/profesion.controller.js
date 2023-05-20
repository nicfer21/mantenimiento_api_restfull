import ProfesionModel from "../models/profesion.model.js";

/* Mostrar todos los registros */

export const getAllProfesion = async (req, res) => {
  try {
    const rs = await ProfesionModel.findAll({
      order: [["idProfesion", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneProfesion = async (req, res) => {
  try {
    const rs = await ProfesionModel.findOne({
      where: {
        idProfesion: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
