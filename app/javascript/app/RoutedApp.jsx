import React from "react";
import { RouterProvider } from "react-router-dom";
import router from '../routes';

const RoutedApp = () => (
    <RouterProvider router={router} />
);

export default RoutedApp;
