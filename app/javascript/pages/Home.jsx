import React, { useState, useEffect } from "react";
import ListItemCard from "../components/ListItemCard";
import CreateButton from "../components/CreateButton";

const Home = () => {
  const [itineraries, setItineraries] = useState([]);

  useEffect(() => {
    fetch("/api/v1/itineraries")
      .then((response) => response.json())
      .then((data) => setItineraries(data))
      .catch((error) => console.error("Error fetching data:", error));
  }, []);

  const handlePrint = (itineraryId) => {
    fetch(`/api/v1/itineraries/${itineraryId}/print`, {
      method: "GET",
    })
      .then((response) => response.blob())
      .then((blob) => {
        const fileUrl = window.URL.createObjectURL(blob);
        window.open(fileUrl, "_blank");
      })
      .catch((error) => console.error("Error printing itinerary:", error));
  };

  return (
    <div style={{ display: "flex", flexDirection: "column", padding: "20px" }}>
      <h1 className="text-3xl font-bold text-gray-800 mb-2">
        Travel Solutions
      </h1>
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
            onPrint={() => handlePrint(itinerary.id)}
            onDuplicate={() => console.log("Duplicate", itinerary.id)}
            additionalContent={
              <h2 className="text-xl font-semibold">
                {itinerary.traveller_name}
              </h2>
            }
          />
        ))}
      </ul>
    </div>
  );
};

export default Home;
