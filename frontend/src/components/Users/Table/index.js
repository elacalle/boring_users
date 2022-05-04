import Row from "./Row";

export default function Table(props) {
  const { data, deleteHandler } = props;

  return (
    <div>
      {data.map((u) => (
        <Row user={u} key={u.uid} deleteHandler={deleteHandler} />
      ))}
    </div>
  );
}
