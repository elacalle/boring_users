import { Link } from "react-router-dom";

export default function Row(props) {
  const { deleteHandler } = props;
  const { uid, first_name } = props.user;

  return (
    <div>
      <div>
        <Link to={`users/${uid}`}>{first_name}</Link>
      </div>
      <div>
        <button
          onClick={() => {
            deleteHandler(uid);
          }}
        >
          Delete
        </button>
      </div>
    </div>
  );
}
