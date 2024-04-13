import React from 'react';

const Sidebar = ({ isOpen, toggle }) => {
  return (
    <div className={`fixed top-0 left-0 h-screen w-48 bg-custom-background text-custom-gray flex flex-col p-2 lg:p-0 transition-transform duration-300 ${isOpen ? 'transform-none' : '-translate-x-full'}`}>
      <div className="logo-section" style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', borderBottom: '1px solid gray', height: '64px' }}>
        {/* <img src="path_to_logo.jpg" alt="Logo" style={{ height: '50px' }} /> */}
      </div>
      <ul style={{ listStyleType: 'none', padding: 0, width: '100%' }}>
        <li style={{ borderBottom: '1px solid gray', cursor: 'pointer', padding: '10px' }}>
          Itineraries
        </li>
        <li style={{ borderBottom: '1px solid gray', cursor: 'pointer', padding: '10px' }}>
          Quotations
        </li>
      </ul>
    </div>
  );
};

export default Sidebar;
