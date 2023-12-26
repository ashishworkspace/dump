import React from 'react';
import AlgebraAccordion from './AlgebraAccordion'; // Adjust the path based on your project structure
import data from './data.json'; // Replace with your actual data

const App = () => {
  return (
    <div className="App">
      <AlgebraAccordion data={data.algebra} />
    </div>
  );
};

export default App;
