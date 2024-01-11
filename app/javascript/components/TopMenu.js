import React from 'react';
import { motion } from 'framer-motion';

const TopMenu = ({ masteryLevel, userSignedIn }) => {
  return (
    <>
    <motion.div
      whileHover={{ scale: 1.05 }}
      whileTap={{ scale: 0.95 }}
      className="p-6 rounded-lg shadow-md mt-6 max-w-4xl mx-auto hover:bg-green-500 bg-green-400"
    >
      <a href="/weak_quizzes/start" className="block">
        <h2 className="text-3xl lg:text-4xl font-bold text-gray-800 mb-2 text-center">苦手克服チャレンジ</h2>
        <p className="text-lg font-medium text-gray-700 text-center">苦手なクイズの克服にチャレンジできます。</p>
        <p className="text-lg font-medium text-gray-700 text-center">各クイズにたくさん挑戦した後にチャレンジしてください。</p>
        {userSignedIn ? (
          <div className="p-2 border border-sky-300 rounded-md bg-green-100 mt-2 max-w-xs mx-auto">
            <p className="text-base font-bold sm:text-xl lg:text-2xl text-center">苦手克服度:</p>
            <p className="text-xl font-bold sm:text-xl lg:text-3xl text-center">{masteryLevel}%</p>
          </div>
        ) : (
          <div className="p-2 border border-sky-300 rounded-md bg-green-100 mt-2 max-w-xs mx-auto">
            <p className="text-base font-bold sm:text-xl lg:text-2xl text-center">苦手克服度:</p>
            <p className="text-xl sm:text-xl lg:text-2xl text-center">ログインで表示</p>
          </div>
        )}
      </a>
    </motion.div>

    <motion.div
      whileHover={{ scale: 1.05 }}
      whileTap={{ scale: 0.95 }}
      className="bg-blue-300 p-6 rounded-lg shadow-md mt-6 max-w-4xl mx-auto hover:bg-blue-400"
    >
      <a href="/quizzes" className="block">
      <h2 className="text-2xl lg:text-3xl font-bold text-gray-800 mb-2 text-center">クイズ一覧</h2>
        <p className="text-lg font-medium text-gray-700 text-center">全てのクイズを検索して見ることができます。</p>
        <p className="text-lg font-medium text-gray-700 text-center">気になったクイズがあったら、検索してみてください。</p>
      </a>
    </motion.div>
    </>
  );
};

export default TopMenu;