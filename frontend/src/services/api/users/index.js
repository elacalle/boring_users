import url from "./../url";

const service = {
  index() {
    return fetch(`${url}/users`).then((response) => {
      return response;
    });
  },
  create(user) {
    return fetch(`${url}/users`, {
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      method: "POST",
      body: JSON.stringify({ data: { user: user } }),
    }).then((response) => {
      return response;
    });
  },
  update(id, user) {
    return fetch(`${url}/users/${id}`, {
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      method: "PUT",
      body: JSON.stringify({ data: { user } }),
    }).then((response) => {
      return response;
    });
  },
  get(id) {
    return fetch(`${url}/users/${id}`).then((response) => {
      return response;
    });
  },
  delete(id) {
    return fetch(`${url}/users/${id}`, { method: "DELETE" }).then(
      (response) => {
        return response;
      }
    );
  },
};

export default service;
