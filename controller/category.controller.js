import CategoryModel from "../models/category.model.js";

/* Mostrar todos los registros */

export const getAllCategory = async (req, res) => {
  try {
    const rs = await CategoryModel.findAll({
      order: [["idCategory", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneCategory = async (req, res) => {
  try {
    const rs = await CategoryModel.findOne({
      where: {
        idCategory: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
