import React from "react";
import { createRoot } from "react-dom/client";
import RoutedApp from "./app/RoutedApp";

const root = createRoot(
    document.body.appendChild(document.createElement("div"))
);

root.render(<RoutedApp />);