import PurchaseModel from "../models/purchase.model.js";

export const getAllPurchase = async (req, res) => {
  try {
    const rs = await PurchaseModel.findAll({
      order: [["idPurchase", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOnePurchase = async (req, res) => {
  try {
    const rs = await PurchaseModel.findOne({
      where: {
        idPurchase: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
