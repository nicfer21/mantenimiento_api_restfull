import MachineModel from "../models/machine.model.js";

/* Mostrar todos los registros */

export const getAllMachine = async (req, res) => {
  try {
    const rs = await MachineModel.findAll({
      order: [["idMachine", "ASC"]],
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};

export const getOneMachine = async (req, res) => {
  try {
    const rs = await MachineModel.findOne({
      where: {
        idMachine: req.params.id,
      },
    });
    res.json(rs);
  } catch (error) {
    res.json({
      error: error,
    });
  }
};
