import { Link } from "react-router-dom";
import Button from "./../../../../components/shared/Button";
import "./index.css";

export default function Row(props) {
  const { deleteHandler } = props;
  const { uid, first_name } = props.user;

  return (
    <div className="row">
      <div className="link">
        <Link to={`users/${uid}`}>{first_name}</Link>
      </div>
      <div>
        <Button
          text="Delete"
          handler={() => {
            deleteHandler(uid);
          }}
        />
      </div>
    </div>
  );
}
