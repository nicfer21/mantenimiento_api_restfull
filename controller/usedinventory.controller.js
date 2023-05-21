import UsedInventoryModel from "../models/usedinventory.model.js";

export const getAllUsedInventory = async (req, res) => {
  try {
    const rs = await UsedInventoryModel.findAll({
      order: [["idUsedInventory", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneUsedInventory = async (req, res) => {
  try {
    const rs = await UsedInventoryModel.findOne({
      where: {
        idUsedInventory: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
