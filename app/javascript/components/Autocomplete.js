import React, { useState, useEffect, useRef } from 'react';

const Autocomplete = () => {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);

  const lastQueryRef = useRef(); // 最後のクエリを追跡するためのref

  // オートコンプリート機能
  const performSearch = async (page = currentPage) => {
    const timestamp = new Date().getTime();
    lastQueryRef.current = timestamp; // 現在のタイムスタンプを保存
    const response = await fetch(`/quizzes/search?query=${encodeURIComponent(query)}&timestamp=${timestamp}&page=${page}`);
    
    if (!response.ok) {
      console.error("検索リクエストに失敗しました");
      return;
    }

    const data = await response.json();

    if (timestamp === lastQueryRef.current) { // 最後のリクエストがこのリクエストであるかを確認
      setResults(data.quizzes);
      setTotalPages(data.pagination.total_pages);
    }
  };

  useEffect(() => {
    setCurrentPage(1);
    performSearch(1);
  }, [query]);

  useEffect(() => {
    performSearch();
  }, [currentPage,query]);

  const Pagination = ({ totalPages, setCurrentPage, currentPage  }) => (
    <div className="flex justify-center my-6">
      {Array.from({ length: totalPages }, (_, i) => i + 1).map(page => (
        <button
          key={page}
          onClick={() => {
            setCurrentPage(page);
            performSearch(page);
          }}
          className={`text-lg px-4 py-2 mx-2 border border-gray-300 rounded shadow 
                    ${page === currentPage ? 'bg-blue-500 text-white' : 'bg-white hover:bg-gray-200 '}`}
        >
          {page}
        </button>
      ))}
    </div>
  );

  return (
    <><div>
        <div className="text-center mt-2 mb-4">
          <p className="text-base md:text-lg text-gray-700">質問、正解、解説、クイズセット名で検索できます。</p>
        </div>
        <div className="flex justify-center mb-6">
          <input
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            className="form-input pl-4 pr-10 py-2 border-2 border-gray-300 rounded-full shadow-sm focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition duration-300 ease-in-out w-full max-w-md" />
        </div>
        <Pagination totalPages={totalPages} setCurrentPage={setCurrentPage} currentPage={currentPage} />
        {results.map(quiz => (
          <div key={quiz.id} className="max-w-6xl mx-auto p-6 bg-white rounded-lg shadow-md mb-6 border border-gray-200 hover:shadow-lg transition duration-300 ease-in-out">
            <p className="text-lg font-semibold text-gray-800 mb-2"><strong>質問：</strong>{quiz.question}</p>
            <p className="text-lg font-semibold text-gray-800 mb-2"><strong>正解：</strong>{quiz.choices.find(choice => choice.correct).text}</p>
            <p className="text-lg font-semibold text-gray-800 mb-2"><strong>説明：</strong>{quiz.explanation}</p>
            <p className="text-lg font-semibold text-gray-800"><strong>クイズセット名：</strong>{quiz.quiz_set.title}</p>
          </div>
        ))}
      </div>
      <Pagination totalPages={totalPages} setCurrentPage={setCurrentPage} currentPage={currentPage} />
    </>
  );
};

export default Autocomplete;
