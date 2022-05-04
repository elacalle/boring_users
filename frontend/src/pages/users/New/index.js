import { useState } from "react";
import { Link, Navigate } from "react-router-dom";
import Title from "./../../../components/shared/Title";
import Form from "./../../../components/Users/Form";
import TextInput from "./../../../components/shared/TextInput";
import ErrorLabel from "./../../../components/shared/ErrorLabel";
import Api from "./../../../services/api";
import Uid from "./../../../services/shared/uid";

export default function New() {
  const [data, setData] = useState({
    success: null,
    errors: {},
    user: {
      first_name: "",
      last_name: "",
      email: "",
      phone_number: "",
    },
  });

  const handleChange = (e) => {
    setData({
      ...data,
      user: {
        ...data.user,
        [e.target.name]: e.target.value,
      },
    });
  };

  const submit = (e) => {
    Api.users
      .create({ uid: Uid.generate(), ...data.user })
      .then(async (response) => {
        const responseData = await response.json();
        if (response.ok) {
          setData({
            ...data,
            success: true,
          });
        } else {
          setData({
            ...data,
            errors: responseData.data.errors,
          });
        }
      });
  };

  if (data.success) {
    return <Navigate to="/" />;
  }

  return (
    <div>
      <Title text="New user" />
      <Form data={data} handler={handleChange}>
        <TextInput model="email" data={data.user} handler={handleChange}>
          Email
        </TextInput>
        <ErrorLabel model="email" errors={data.errors} />
      </Form>
      <button onClick={submit}>Create</button>
      <Link to="/">Back</Link>
    </div>
  );
}
