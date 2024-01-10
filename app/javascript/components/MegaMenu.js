import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { motion } from 'framer-motion';

const MegaMenu = ({ onClose }) => {
  const [quizSets, setQuizSets] = useState([]);

  useEffect(() => {
    // クイズセットのデータを取得
    axios.get('/api/quiz_sets')
      .then(response => {
        setQuizSets(response.data);
      })
      .catch(error => console.log(error));
  
    // メニュー外のクリックを検知するハンドラ
    const handleOutsideClick = (event) => {
      if (event.target.closest('.mega-menu')) {
        return;
      }
      onClose();
    };
  
    // メニュー外のクリックを監視
    document.addEventListener('mousedown', handleOutsideClick);
  
    // クリーンアップ関数
    return () => {
      document.removeEventListener('mousedown', handleOutsideClick);
    };
  }, [onClose]);


  const variants = {
    hidden: { opacity: 0, y: -100 },
    visible: { opacity: 1, y: 0 }
  };

  return (
    <motion.div 
      className="absolute inset-x-0 top-full z-50 bg-white w-screen shadow-lg p-4"
      initial="hidden"
      animate="visible"
      exit="hidden"
      variants={variants}
    >
      <div className="absolute inset-x-0 top-full z-50 bg-white w-screen shadow-lg p-4">
          <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-8 gap-4">
            {quizSets.map((quizSet) => (
              <a key={quizSet.id} href={`/quiz_sets/${quizSet.id}`} className="block text-center">
                <div className="bg-sky-100 hover:bg-sky-200 transition duration-300 ease-in-out rounded-lg p-4 flex justify-center items-center aspect-square">
                  <div className="md:text-lg lg:text-xl font-bold text-blue-600 mb-2">{quizSet.title}</div>
                </div>
              </a>
            ))}
            <a href="/weak_quizzes/start" className="block text-center"> {}
            <div className="col-span-full bg-green-400 hover:bg-green-500 transition duration-300 ease-in-out rounded-lg p-4 flex justify-center items-center aspect-square">
                <div className="md:text-lg lg:text-xl font-bold text-white mb-2">苦手克服チャレンジ</div>
            </div>
            </a>
          </div>
        </div>
    </motion.div>
  );
};

export default MegaMenu;
