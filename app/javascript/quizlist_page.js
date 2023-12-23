import React from 'react';
import { createRoot } from 'react-dom/client';
import Autocomplete from './components/Autocomplete';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('autocomplete-root');
  if (container) {
    const root = createRoot(container);
    root.render(<Autocomplete />);
  }
});