export default function Button({ text, handler }) {
  return <button onClick={handler}>{text}</button>;
}
