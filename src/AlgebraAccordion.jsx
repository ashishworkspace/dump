import React, { useState } from 'react';

const AlgebraAccordion = ({ data }) => {
  const [activeAccordion, setActiveAccordion] = useState(null);
  const [activeExercise, setActiveExercise] = useState(null);

  const toggleAccordion = (accordion) => {
    setActiveAccordion(activeAccordion === accordion ? null : accordion);
    setActiveExercise(null); // Reset active exercise when accordion is toggled
  };

  const toggleExercise = (exercise) => {
    setActiveExercise(activeExercise === exercise ? null : exercise);
  };

  return (
    <div className="max-w-xl mx-auto mt-8">
      {Object.keys(data).map((accordion) => (
        <div key={accordion} className="mb-4">
          <div
            className="bg-gray-200 p-3 cursor-pointer"
            onClick={() => toggleAccordion(accordion)}
          >
            {accordion}
          </div>
          {activeAccordion === accordion && (
            <div className="pl-4 m-5">
              {data[accordion].map((item) => (
                <div key={item.exercise} className="mb-2">
                  <div
                    className={`bg-gray-100 p-2 cursor-pointer ${
                      activeExercise === item.exercise ? 'active' : ''
                    }`}
                    onClick={() => toggleExercise(item.exercise)}
                  >
                    {item.exercise}
                  </div>
                  {activeExercise === item.exercise && (
                    <ul className="pl-4">
                      {item.concepts.map((concept) => (
                        <li key={concept} className="bg-gray-50 p-2">
                          {concept}
                        </li>
                      ))}
                    </ul>
                  )}
                </div>
              ))}
            </div>
          )}
        </div>
      ))}
    </div>
  );
};

export default AlgebraAccordion;
