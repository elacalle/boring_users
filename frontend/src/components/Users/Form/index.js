import TextInput from "../../shared/TextInput";
import ErrorLabel from "../../shared/ErrorLabel";

export default function Form({ handler, data, children }) {
  const { user, errors } = data;

  return (
    <div>
      <TextInput model="first_name" data={user} handler={handler}>
        First name
      </TextInput>
      <ErrorLabel model="first_name" errors={errors} />
      <TextInput model="last_name" data={user} handler={handler}>
        Last name
      </TextInput>
      <ErrorLabel model="last_name" errors={errors} />
      {children}
      <TextInput model="phone_number" data={user} handler={handler}>
        Phone number
      </TextInput>
      <ErrorLabel model="phone_number" errors={errors} />
    </div>
  );
}
