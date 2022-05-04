import { useEffect, useState } from "react";
import Table from "./../../../components/Users/Table";
import Title from "./../../../components/shared/Title";
import Api from "./../../../services/api";
import { Link, Outlet } from "react-router-dom";

export default function Index() {
  const [data, setData] = useState({ users: [] });

  const deleteHandler = (id) => {
    Api.users.delete(id).then((response) => {
      if (response.ok) {
        loadUsers();
      }
    });
  };

  const loadUsers = () => {
    Api.users.index().then(async (response) => {
      const {
        data: { users },
      } = await response.json();

      setData({
        users,
      });
    });
  };

  useEffect(() => {
    loadUsers();
  }, []);

  return (
    <div>
      <Title text="Users" />
      <Table data={data.users} deleteHandler={deleteHandler} />
      <Link to="users/new">New users</Link>
      <Outlet />
    </div>
  );
}
