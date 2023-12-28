import React, { useState, useEffect } from 'react';
import axios from 'axios';

const MegaMenu = ({ onClose }) => {
  const [quizSets, setQuizSets] = useState([]);

  useEffect(() => {
    axios.get('/api/quiz_sets')
      .then(response => {
        setQuizSets(response.data);
      })
      .catch(error => console.log(error));

    // アンマウント時に onClose コールバックを実行
    return () => onClose?.();
  }, [onClose]);

  return (
        <div className="absolute inset-x-0 top-full z-50 bg-white w-screen shadow-lg p-4">
          <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-8 gap-4">
            {quizSets.map((quizSet, index) => (
              <a key={quizSet.id} href={`/quiz_sets/${quizSet.id}`} className="block text-center">
                <div className="bg-sky-100 hover:bg-sky-200 transition duration-300 ease-in-out rounded-lg p-4 flex justify-center items-center aspect-square">
                  <div className="font-bold text-blue-600 mb-2">{quizSet.title}</div>
                </div>
              </a>
            ))}
            <a href="/weak_quizzes/start" className="block text-center"> {}
            <div className="col-span-full bg-green-400 hover:bg-green-500 transition duration-300 ease-in-out rounded-lg p-4 flex justify-center items-center aspect-square">
                <div className="font-bold text-white mb-2">苦手克服チャレンジ</div>
            </div>
            </a>
          </div>
        </div>
  );
};

export default MegaMenu;
