import React, { useState, useEffect } from 'react';

const Autocomplete = () => {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState([]);

  // オートコンプリート機能
  const performSearch = async () => {
    if (query.length < 1) {
      return;
    }

    const timestamp = new Date().getTime();
    const response = await fetch(`/quizzes/search?query=${encodeURIComponent(query)}&timestamp=${timestamp}`);
    
    if (!response.ok) {
      console.error("検索リクエストに失敗しました");
      return;
    }

    const data = await response.json();
    setResults(data);
  };

  useEffect(() => {
    performSearch();
  }, [query]);

  // 検索を実行する関数
  const handleSearch = () => {
    window.location.href = `/quizzes?query=${encodeURIComponent(query)}`;
  };

  return (
    <div>
      <div className="flex justify-center my-4">
        <div className="relative w-2/5 lg:w-2/5">
          <div className="flex">
            <input 
              type="text"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              className="form-input flex-grow h-10 border-2 border-blue-300 shadow-lg rounded-l-md"
            />
            <button 
              onClick={handleSearch}
              className="flex items-center justify-center bg-blue-100 text-blue-800 px-4 h-10 rounded-r-md"
            >
              検索
            </button>
          </div>
          <ul className="autocomplete-results-list absolute z-20 bg-sky-200 w-full rounded-md shadow-lg mt-1 max-h-60 overflow-auto">
            {results.map((item, index) => (
            <li key={item.id || index} className="autocomplete-result-item p-2 border-b border-white bg-light-blue-100">
              <strong className="font-bold text-gray-800">質問:</strong> {item.question}<br />
              <strong className="font-bold text-gray-800">正解:</strong> {item.correct_answer}<br />
              <strong className="font-bold text-gray-800">説明:</strong> {item.explanation}<br />
              <strong className="font-bold text-gray-800">クイズセットタイトル:</strong> {item.quiz_set_title}
            </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
};

export default Autocomplete;