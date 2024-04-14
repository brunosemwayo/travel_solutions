import React, { useState, useEffect } from 'react';
import ListItemCard from '../components/ListItemCard';

const Home = () => {
  const [itineraries, setItineraries] = useState([]);

  useEffect(() => {
    fetch('/api/v1/itineraries')
      .then(response => response.json())
      .then(data => setItineraries(data))
      .catch(error => console.error('Error fetching data:', error));
  }, []);

  const handlePrint = (itineraryId) => {
    fetch(`/api/v1/itineraries/${itineraryId}/print`, { method: 'GET' })
      .then(response => response.blob())
      .then(blob => {
        const fileUrl = window.URL.createObjectURL(blob);
        window.open(fileUrl, '_blank');
      })
      .catch(error => console.error('Error printing itinerary:', error));
  };

  const handleCreate = () => {
    window.location.href = '/admin/itinerary'; // Redirect to the Rails admin page
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', padding: '20px' }}>
      <h1 className="text-3xl font-bold text-gray-800 mb-2">Travel Solutions</h1>
      <div style={{ width: 'fit-content' }}>
        <button onClick={handleCreate} className="inline-flex items-center border font-bold py-2 px-4 rounded-full hover:border-2 bg-blue-500 hover:bg-blue-700 text-white">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="currentColor" className="w-6 h-6 mr-2">
            <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
          </svg>
          New Itinerary
        </button>
      </div>
      <ul>
        {itineraries.map((itinerary) => (
          <ListItemCard
            key={itinerary.id}
            item={itinerary}
            onDelete={() => console.log('Delete', itinerary.id)}
            onEdit={() => console.log('Edit', itinerary.id)}
            onPrint={() => handlePrint(itinerary.id)}
            onDuplicate={() => console.log('Duplicate', itinerary.id)}
            additionalContent={<h2 className="text-xl font-semibold">{itinerary.traveller_name}</h2>}
          />
        ))}
      </ul>
    </div>
  );
};

export default Home;
