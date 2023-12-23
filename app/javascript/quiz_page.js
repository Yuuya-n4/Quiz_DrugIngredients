import React from 'react';
import { createRoot } from 'react-dom/client';
import StarRating from './components/StarRating';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('star-rating-root');
  if (container) {
    const root = createRoot(container);
    root.render(<StarRating />);
  }
});
