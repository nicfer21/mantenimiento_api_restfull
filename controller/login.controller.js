import jwt from "jsonwebtoken";
import db from "../database/mantenimiento.db.js";
import SessionClientModel from "../models/sessionclient.model.js";

export const initLogging = async (req, res) => {
  try {
    const { username, password } = req.body;
    const rs = await db.query(
      `SELECT * from view_searchworkerclient as v where v.dni = "${username}" and v.pass = "${password}" ;`
    );
    const { id, dni, largename, name, image, pass, levelWork, idClient } =
      rs[0][0];
    const token = getToken(id, dni, largename, name, image, pass, levelWork);
    await SessionClientModel.create({
      idClient: idClient,
    });
    res.json({ messege: "OK", token });
  } catch (error) {
    res.json({ messege: "NO", token: error });
  }
};

// Generacion del token
const getToken = (id, dni, largename, name, image, pass, levelWork) => {
  const payload = { id, dni, largename, name, image, pass, levelWork };
  const secret = "mantenimiento";
  const options = { expiresIn: "2400h" }; // '30m' '1h' '24h'
  return jwt.sign(payload, secret, options);
};
