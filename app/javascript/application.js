// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"

import React from 'react';
import { createRoot } from 'react-dom/client';
import HelloReact from './components/HelloReact';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('react-root') || document.body.appendChild(document.createElement('div'));
  const root = createRoot(container);
  root.render(<HelloReact />);
});
