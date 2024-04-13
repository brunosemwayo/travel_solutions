import React from 'react';

const Sidebar = ({ isOpen, toggle }) => {
  return (
    <div className={`fixed top-0 left-0 h-screen w-48 bg-gray-100 text-gray-800 flex flex-col p-2 lg:p-0 transition-transform duration-300 ${isOpen ? 'transform-none' : '-translate-x-full'}`}>
      <div className="flex justify-center items-center border-b border-gray-300 h-16">
        
      </div>
      <ul className="list-none p-0 m-0 w-full">
        <li className="border-b border-gray-300 cursor-pointer py-2 px-4 hover:bg-gray-200">
          Itineraries
        </li>
        <li className="border-b border-gray-300 cursor-pointer py-2 px-4 hover:bg-gray-200">
          Quotations
        </li>
      </ul>
    </div>
  );
};

export default Sidebar;
