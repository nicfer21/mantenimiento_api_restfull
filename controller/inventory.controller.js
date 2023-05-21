import InventoryModel from "../models/inventory.model.js";

export const getAllInventory = async (req, res) => {
  try {
    const rs = await InventoryModel.findAll({
      order: [["idInventory", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneInventory = async (req, res) => {
  try {
    const rs = await InventoryModel.findOne({
      where: {
        idInventory: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
