import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import Users from "./pages/users";
import Index from "./pages/users/Index";
import New from "./pages/users/New";
import Edit from "./pages/users/Edit";
import { BrowserRouter, Routes, Route } from "react-router-dom";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <div className="container">
    <React.StrictMode>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Index />} />
          <Route path="users" element={<Users />}>
            <Route index element={<Index />} />
            <Route path="new" element={<New />} />
            <Route path=":id" element={<Edit />} />
          </Route>
        </Routes>
      </BrowserRouter>
    </React.StrictMode>
  </div>
);
