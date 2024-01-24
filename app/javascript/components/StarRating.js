import React, { useEffect, useState } from 'react';
import Stars from 'react-stars';
import axios from 'axios';

const StarRating = ({ quizId }) => {
  const [currentRating, setCurrentRating] = useState(0);

  useEffect(() => {
    // ページロード時に現在の評価を取得する
    axios.get(`/api/ratings?quiz_id=${quizId}`)
      .then(response => {
        if (response.data.rating) {
          setCurrentRating(response.data.rating.score);
        }
      })
      .catch(error => {
        console.log('Error fetching rating:', error);
      });
  }, [quizId]);

  const ratingChanged = (newRating) => {
    // 新しい評価値を整数に丸める
    const roundedRating = Math.round(newRating);
    // CSRFトークンの取得とヘッダーへの設定
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;
    // 新しい評価をサーバーに送信
    axios.post(`/api/ratings`, {
      rating: {
        quiz_id: quizId,
        score: newRating
      }
    })
    .then(response => {
      // 現在の評価を更新
      setCurrentRating(newRating);
    })
    .catch(error => {
      console.log('Error submitting rating:', error);
    });
  };

  return (
    <Stars
      count={5}
      value={currentRating}
      onChange={ratingChanged}
      size={24}
      color2={'#ffd700'}
      half={false}
    />
  );
};

export default StarRating;