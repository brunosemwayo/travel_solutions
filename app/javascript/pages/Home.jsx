import React from 'react';
import Sidebar from '../components/Sidebar'; // Adjust the path as needed

const HelloWorld = () => {
  return (
    <div style={{ display: 'flex' }}>
      <Sidebar />
      <div style={{ flexGrow: 1, padding: '20px' }}>
        <h1>Itineraries</h1>
      </div>
    </div>
  );
};

export default HelloWorld;
