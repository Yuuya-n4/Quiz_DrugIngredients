import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';

const Note = () => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <>
      <button 
        onClick={() => setIsOpen(!isOpen)} 
        className="text-base sm:text-xl px-4 sm:px-6 py-2 sm:py-4 my-4 sm:my-8 bg-blue-600 text-white rounded hover:bg-blue-700 transition duration-300 mx-auto block font-semibold shadow-2xl"
      >
        {isOpen ? 'サービス説明を閉じる' : 'サービス説明を開く'}
      </button>
      
      <AnimatePresence>
      {isOpen && (
        <motion.div
        initial={{ opacity: 0, height: 0 }}
        animate={{ opacity: 1, height: 'auto' }}
        exit={{ opacity: 0, height: 0 }}
        transition={{ duration: 0.5 }}
        style={{ originY: 0 }}
        className="note bg-white py-4 sm:py-6 rounded-lg mx-auto shadow-lg border-2 border-gray-300 mt-2 mb-6 max-w-4xl"
      >

        <h1 className="text-2xl sm:text-4xl font-bold text-gray-800 mt-4 mb-4 text-center">「クイズ！市販薬の成分」とは</h1>

        <div className="bg-white bg-opacity-75 p-4 sm:p-6 rounded-lg max-w-4xl mx-auto">

            <h2 className="text-2xl font-bold text-gray-800 mb-4">簡単なクイズで薬の成分を学べるサービスです。</h2>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            薬について知りたいな、気になるな、という方におすすめです。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            薬について知らない人でも、クイズの中にきっと気になる成分が見つかります。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            薬って難しそう。知らない単語がたくさんありそう。などの不安があっても大丈夫。薬の成分を知っていくうちに、楽しい発見がたくさんあります。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            今度薬を買う時、もちろんすぐ店員に相談するのも良いですが、その前に自分でも自分の症状に合っているか成分を見て考えてみるのもいいかもしれません。
            </p>
    
            <h2 className="text-2xl font-bold text-gray-800 mb-4 mt-6">登録販売者資格を目指す方へ。</h2>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            登録販売者資格の勉強を始めると、初めは知らない単語ばかりでなかなか手が進まないかもしれません。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            このサービスでは、できるだけ身近できになるような成分をクイズ形式で出題します。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            登録販売者資格の入門、第一歩としてもぜひご利用ください。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            このサービスで苦手克服度100%を目指して、自信をつけましょう！
            </p>
    
            <h2 className="text-2xl font-bold text-gray-800 mb-4 mt-6">サービスの内容</h2>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            大きく分けて２つのサービスがあります。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            サービスの利用には会員登録が必須です。よろしくお願いいたします。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            連絡なくクイズの変更、削除、追加の可能性があります。また、クイズの内容には不足などもあるかもしれません。ご了承ください。
            </p>
            <h3 className="text-xl font-bold text-gray-800 mb-4 mt-6">● クイズ</h3>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            薬の種類ごとに、クイズのセットを作りました。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            気になるクイズセットに挑戦してみてください。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            各クイズセットの中からランダムで10問出題されます。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            たくさん何度も挑戦してみてください。過去のスコアは右上の「スコアページ」から確認できます。
            </p>
            <h3 className="text-xl font-bold text-gray-800 mb-4 mt-6">● 苦手克服チャレンジ</h3>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            各クイズにたくさん挑戦した後にチャレンジしてみてください。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            苦手を克服することに特化したサービスです。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            あなたの苦手なクイズを判定し、そこからクイズを出題します。
            </p>
            <p className="text-base md:text-lg text-gray-700 mb-2">
            苦手克服度100%を目指してみてください。
            </p>
        </div>
        </motion.div>
      )}
      </AnimatePresence>
      </>
  );
};

export default Note;