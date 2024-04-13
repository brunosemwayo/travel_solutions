import React from 'react';
import { createBrowserRouter } from 'react-router-dom';
import Button from '@mui/material/Button'; // Ensure MUI is installed

const HelloWorld = () => {
  return (
    <div style={{ marginTop: '20px', textAlign: 'center' }}>
      <Button variant="contained" color="primary">
        Hello World
      </Button>
    </div>
  );
};

export default HelloWorld