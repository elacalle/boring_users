import Row from "./Row";
import "./index.css";

export default function Table(props) {
  const { data, deleteHandler } = props;

  return (
    <div className="table">
      {data.map((u) => (
        <Row user={u} key={u.uid} deleteHandler={deleteHandler} />
      ))}
    </div>
  );
}
