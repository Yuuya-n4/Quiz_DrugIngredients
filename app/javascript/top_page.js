import React from 'react';
import { createRoot } from 'react-dom/client';
import HelloReact from './components/HelloReact';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('hello-react-root');
  if (container) {
    const root = createRoot(container);
    root.render(<HelloReact />);
  }
});