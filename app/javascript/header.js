import React, { useState, useEffect } from 'react';
import { createRoot } from 'react-dom/client';
import MegaMenu from './components/MegaMenu';
import { AnimatePresence } from 'framer-motion';

const Header = ({ userSignedIn }) => {
  const [isHamburgerMenuOpen, setIsHamburgerMenuOpen] = useState(false);
  const [isMegaMenuOpen, setIsMegaMenuOpen] = useState(false);

  const toggleHamburgerMenu = () => {
    setIsHamburgerMenuOpen(prevState => !prevState);
  };

  const toggleMegaMenu = (event) => {
    event.preventDefault();
    setIsMegaMenuOpen(prevState => !prevState);
  };

  useEffect(() => {
    const megaMenuButtonPC = document.getElementById('mega-menu-button-pc');
    const megaMenuButtonMobile = document.querySelector('.hamburger-menu .mega-menu-link');
  
    // pointerdown イベントのリスナーを追加
    megaMenuButtonPC?.addEventListener('pointerdown', toggleMegaMenu);
    megaMenuButtonMobile?.addEventListener('pointerdown', toggleMegaMenu);
  
    return () => {
      // pointerdown イベントのリスナーを削除
      megaMenuButtonPC?.removeEventListener('pointerdown', toggleMegaMenu);
      megaMenuButtonMobile?.removeEventListener('pointerdown', toggleMegaMenu);
    };
  }, [isMegaMenuOpen]);

  return (
    <>
      {isHamburgerMenuOpen && (
        <div className="hamburger-menu">
        <div className="flex flex-col items-center space-y-4">
          {userSignedIn ? (
            <>
              <a href="#" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300">ジャンル一覧</a>
              <a href="/quizzes" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300">クイズ検索</a>
              <a href="/scores/mypages" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300">スコアページ</a>
              <a href="/profile/mypages" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300">ユーザー情報編集</a>
              <a href="/logout" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300">ログアウト</a>
            </>
          ) : (
            <>
              <a href="/register" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300">会員登録</a>
              <a href="/login" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300">ログイン</a>
            </>
          )}
        </div>
      </div>
      )}
      <AnimatePresence>
        {isMegaMenuOpen && (
          <MegaMenu key="mega-menu" onClose={() => setIsMegaMenuOpen(false)} />
        )}
      </AnimatePresence>
    </>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const headerContainer = document.getElementById('header-container');
  if (headerContainer) {
    const userSignedIn = JSON.parse(headerContainer.getAttribute('data-user-signed-in'));
    const root = createRoot(headerContainer);
    root.render(
      <React.StrictMode>
        <Header userSignedIn={userSignedIn} />
      </React.StrictMode>
    );
  }
});
