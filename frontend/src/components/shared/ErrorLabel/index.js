export default function ErrorLabel({ model, errors }) {
  let errorCode = null;

  if (model in errors) {
    const propertyError = errors[model];
    errorCode = propertyError.length ? propertyError[0].error : null;
  }

  return <div>{errorCode}</div>;
}
