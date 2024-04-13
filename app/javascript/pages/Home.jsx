import React, { useState, useEffect } from "react";
import Sidebar from "../components/Sidebar";
import ListItemCard from "../components/ListItemCard"; // Make sure the path is correct

const HelloWorld = () => {
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
      .then(data => {
        console.log("Data received", data);
        setItineraries(data);
      })
      .catch(error => {
        console.error("Error fetching data:", error);
      });
  }, []);

  return (
    <div style={{ display: "flex" }}>
      <Sidebar />
      <div style={{ flexGrow: 1, padding: "20px" }}>
        <h1>Itineraries</h1>
        <ul>
          {itineraries.map((itinerary) => (
            <ListItemCard
              key={itinerary.id}
              item={itinerary}
              linkPath={`/itineraries/${itinerary.id}`}
              linkLabel="View Details"
              secondaryLinkPath={`/itineraries/${itinerary.id}/edit`}
              secondaryLinkLabel="Edit"
              onDelete={() => console.log("Delete", itinerary.id)}
              onEdit={() => console.log("Edit", itinerary.id)}
              onPrint={() => console.log("Print", itinerary.id)}
              onDuplicate={() => console.log("Duplicate", itinerary.id)}
            />
          ))}
        </ul>
      </div>
    </div>
  );
};

export default HelloWorld;
