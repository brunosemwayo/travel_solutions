import React from "react";
import { Link } from "react-router-dom";

const CreateButton = ({ to, label }) => {
  return (
    <Link
      to={to}
      className="inline-flex items-center border font-bold py-2 px-4 rounded-full hover:border-2 bg-blue-500 hover:bg-blue-700 text-white"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        strokeWidth="1.5"
        stroke="currentColor"
        className="w-6 h-6 mr-2"
      >
        <path
          strokeLinecap="round"
          strokeLinejoin="round"
          d="M12 4.5v15m7.5-7.5h-15"
        />
      </svg>
      {label}
    </Link>
  );
};

export default CreateButton;
