import { useParams, useNavigate, Navigate, Link } from "react-router-dom";
import { useState, useEffect } from "react";
import Form from "./../../../components/Users/Form";
import Title from "./../../../components/shared/Title";
import Button from "./../../../components/shared/Button";
import TextInput from "./../../../components/shared/TextInput";
import ErrorLabel from "./../../../components/shared/ErrorLabel";
import Api from "./../../../services/api";

export default function Edit() {
  const params = useParams();
  const navigate = useNavigate();
  const [data, setData] = useState({
    success: true,
    errors: {},
    user: {
      uid: "",
      first_name: "",
      last_name: "",
      email: "",
      phone_number: "",
    },
  });

  const submit = () => {
    Api.users.update(params.id, data.user).then(async (response) => {
      if (response.ok) {
        navigate("/");
      } else {
        const responseData = await response.json();

        setData({
          ...data,
          errors: responseData.data.errors,
        });
      }
    });
  };

  const handleChange = (e) => {
    setData({
      ...data,
      user: {
        ...data.user,
        [e.target.name]: e.target.value,
      },
    });
  };

  useEffect(() => {
    Api.users.get(params.id).then(async (response) => {
      if (response.ok) {
        const {
          data: { user },
        } = await response.json();

        setData((oldData) => {
          return {
            ...oldData,
            user,
          };
        });
      } else {
        setData({ success: false });
      }
    });
  }, [params]);

  if (!data.success) {
    return <Navigate to="/" />;
  }

  return (
    <div>
      <Title text="Edit user" />
      <Form data={data} handler={handleChange}>
        <TextInput
          disabled={true}
          model="email"
          data={data.user}
          handler={handleChange}
        >
          Email
        </TextInput>
        <ErrorLabel model="email" errors={data.errors} />
      </Form>
      <Button text="Save" handler={submit} />
      <Link to="/">Back</Link>
    </div>
  );
}
