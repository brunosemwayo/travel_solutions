import React from 'react';
import { createBrowserRouter } from 'react-router-dom';
import Helloworld from '../pages/Helloworld'

const router = createBrowserRouter([
    {
        path: "/Helloworld",
        element: <Helloworld />,
      },  
]);

export default router;
