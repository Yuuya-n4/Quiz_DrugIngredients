import React from 'react';
import { motion } from 'framer-motion';

const QuizSetList = ({ quizSets, userSignedIn }) => {
  return (
    <div className="flex justify-center w-full">
    <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 x12:grid-cols-4 gap-4 sm:gap-12 md:gap-6 x12:gap-12 w-full max-w-8xl mx-auto">
      {quizSets.map(quizSet => (
        <motion.div
          key={quizSet.id}
          className="bg-sky-100 rounded-lg shadow-2xl font-semibold aspect-square shadow-2xl hover:bg-sky-200"
          whileHover={{ scale: 1.05 }}
          whileTap={{ scale: 0.9 }}
          transition={{ type: "spring", stiffness: 400, damping: 17 }}
        >
          <a href={`/quiz_sets/${quizSet.id}`} className="block no-underline w-full h-full">
            <div className="flex flex-col justify-center items-center h-full">
              <h2 className="text-2xl sm:text-3xl md:text-4xl lg:text-5xl text-blue-600 text-center mb-2 ms:mb-6 md:mb-10 tracking-widest">{quizSet.title}</h2>
              {userSignedIn ? (
                <div className="p-2 border border-sky-300 rounded-md bg-sky-50 mt-2 max-w-xs mx-auto">
                  <p className="text-base sm:text-xl md:text-xl lg:text-2xl text-center">答えたクイズ数: </p>
                  <p className="text-xl sm:text-xl md:text-xl lg:text-3xl text-center">{quizSet.answered_quizzes_count} / {quizSet.total_quizzes_count}</p>
                </div>
              ) : (
                <div className="p-2 border border-sky-300 rounded-md bg-sky-50 mt-2 max-w-xs mx-auto">
                  <p className="text-base sm:text-xl lg:text-2xl text-center">答えたクイズ数: </p>
                  <p className="text-md sm:text-sm lg:text-xl text-center">ログインで表示</p>
                </div>
              )}
            </div>
          </a>
        </motion.div>
      ))}
    </div>
    </div>
  );
};

export default QuizSetList;