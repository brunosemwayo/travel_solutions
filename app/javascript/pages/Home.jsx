import React, { useState, useEffect } from "react";
import ListItemCard from "../components/ListItemCard"; // Make sure the path is correct
import CreateButton from "../components/CreateButton"; // Import the button

const Home = () => {
  const [itineraries, setItineraries] = useState([]);

  useEffect(() => {
    console.log("Starting to fetch itineraries");
    fetch("/api/v1/itineraries")
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok: " + response.statusText);
        }
        return response.json();
      })
      .then((data) => {
        console.log("Data received", data);
        setItineraries(data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, []);

  return (
    <div style={{ display: "flex", flexDirection: "column", padding: "20px" }}>
      <h1 className="text-3xl font-bold text-gray-800 mb-2">Travel Solutions</h1>
      <div style={{ width: "fit-content" }}>
        <CreateButton to="/create-itinerary" label="New Itinerary" />
      </div>
      <ul>
        {itineraries.map((itinerary) => (
          <ListItemCard
            key={itinerary.id}
            item={itinerary}
            onDelete={() => console.log("Delete", itinerary.id)}
            onEdit={() => console.log("Edit", itinerary.id)}
            onPrint={() => console.log("Print", itinerary.id)}
            onDuplicate={() => console.log("Duplicate", itinerary.id)}
            additionalContent={
              <h2 className="text-xl font-semibold">{itinerary.traveller_name}</h2>
            }
          />
        ))}
      </ul>
    </div>
  );
};

export default Home;
