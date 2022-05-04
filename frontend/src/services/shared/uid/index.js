import { v4 as uuidv4 } from "uuid";

const uid = {
  generate() {
    return uuidv4();
  },
};

export default uid;
