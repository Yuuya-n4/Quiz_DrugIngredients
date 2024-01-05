import React from 'react';
import { createRoot } from 'react-dom/client';
import Note from './components/Note';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('hello-react-root');
  if (container) {
    const root = createRoot(container);
    root.render(
      <React.StrictMode>
        <Note />
      </React.StrictMode>
    );
  }
});