import "./index.css";

export default function TextInput({
  model,
  data,
  handler,
  disabled,
  children,
}) {
  return (
    <div className="text-input">
      <label>
        {children}
        <input
          disabled={disabled}
          type="text"
          name={model}
          value={data[model]}
          onChange={handler}
        />
      </label>
    </div>
  );
}
