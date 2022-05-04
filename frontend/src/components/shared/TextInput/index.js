export default function TextInput(props) {
  const { model, data, handler, disabled } = props;

  return (
    <label>
      {props.children}
      <input
        disabled={disabled}
        type="text"
        name={model}
        value={data[model]}
        onChange={handler}
      />
    </label>
  );
}
