import React from 'react';
import { createRoot } from 'react-dom/client';
import Note from './components/Note';
import QuizSetList from './components/QuizSetList';

document.addEventListener('DOMContentLoaded', () => {
  // Noteコンポーネント用のコンテナ
  const noteContainer = document.getElementById('note-react-root');
  if (noteContainer) {
    const root = createRoot(noteContainer);
    root.render(
      <React.StrictMode>
        <Note />
      </React.StrictMode>
    );
  }

  // QuizSetListコンポーネント用のコンテナ
  const container = document.getElementById('quiz-set-list-react-root');
  if (container) {
    const quizSets = JSON.parse(container.getAttribute('data-quiz-sets'));
    const userSignedIn = JSON.parse(container.getAttribute('data-user-signed-in'));
    const root = createRoot(container);
    root.render(
      <React.StrictMode>
        <QuizSetList quizSets={quizSets} userSignedIn={userSignedIn} />
      </React.StrictMode>
    );
  }
});