import React, { useState, useEffect } from 'react';

const Autocomplete = () => {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);

  // オートコンプリート機能
  const performSearch = async (page = currentPage) => {
    if (query.length < 1) {
      return;
    }

    const timestamp = new Date().getTime();
    const response = await fetch(`/quizzes/search?query=${encodeURIComponent(query)}&timestamp=${timestamp}&page=${page}`);
    
    if (!response.ok) {
      console.error("検索リクエストに失敗しました");
      return;
    }

    const data = await response.json();
    setResults(data.quizzes);
    setTotalPages(data.pagination.total_pages);
  };

  useEffect(() => {
    if (query.length === 0) {
      // フォームが空の時に全クイズを取得
      fetch(`/api/quizzes?page=${currentPage}`)
        .then(response => response.json())
        .then(data => {
          setResults(data.quizzes);
          setTotalPages(data.pagination.total_pages);
        })
        .catch(error => console.error("エラー:", error));
    } else {
      performSearch();
    }
  }, [currentPage,query]);

  const Pagination = ({ totalPages, setCurrentPage }) => (
    <div className="flex justify-center my-6">
      {Array.from({ length: totalPages }, (_, i) => i + 1).map(page => (
        <button
          key={page}
          onClick={() => {
            setCurrentPage(page);
            performSearch(page);
          }}
          className="text-lg px-4 py-2 mx-2 bg-white border border-gray-300 rounded shadow hover:bg-gray-100"
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
      <Pagination totalPages={totalPages} setCurrentPage={setCurrentPage} />
      {results.map(quiz => (
        <div key={quiz.id} className="max-w-6xl mx-auto p-6 bg-white rounded-lg shadow-md mb-6 border border-gray-200 hover:shadow-lg transition duration-300 ease-in-out">
          <p className="text-lg font-semibold text-gray-800 mb-2"><strong>質問：</strong>{quiz.question}</p>
          <p className="text-lg font-semibold text-gray-800 mb-2"><strong>正解：</strong>{quiz.choices.find(choice => choice.correct).text}</p>
          <p className="text-lg font-semibold text-gray-800 mb-2"><strong>説明：</strong>{quiz.explanation}</p>
          <p className="text-lg font-semibold text-gray-800"><strong>クイズセット名：</strong>{quiz.quiz_set.title}</p>
        </div>
      ))}
      </div>
      <Pagination totalPages={totalPages} setCurrentPage={setCurrentPage} />
    </>
  );
};

export default Autocomplete;
