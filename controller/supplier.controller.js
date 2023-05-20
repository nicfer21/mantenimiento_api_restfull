import SupplierModel from "../models/supplier.model.js";

/* Mostrar todos los registros */

export const getAllSupplier = async (req, res) => {
  try {
    const rs = await SupplierModel.findAll({
      order: [["idSupplier", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneSupplier = async (req, res) => {
  try {
    const rs = await SupplierModel.findOne({
      where: {
        idSupplier: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
