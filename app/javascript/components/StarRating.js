import React from 'react';
import Stars from 'react-stars';

const StarRating = () => {
    const ratingChanged = (newRating) => {
        console.log(newRating); // 新しい評価値をコンソールに表示
        // ここで評価値をサーバーに送信するなどの処理を行います
    };

    return (
        <Stars
            count={5} // 星の数
            onChange={ratingChanged} // 評価が変更された時のハンドラ
            size={24} // 星の大きさ
            color2={'#ffd700'} // アクティブな星の色
        />
    );
};

export default StarRating;