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
    let megaMenuButton = isHamburgerMenuOpen
      ? document.getElementById('mega-menu-button-mobile')
      : document.getElementById('mega-menu-button-pc');
  
    // イベントリスナーを設定
    if (megaMenuButton) {
      megaMenuButton.addEventListener('pointerdown', toggleMegaMenu);
    }
  
    // クリーンアップ関数
    return () => {
      if (megaMenuButton) {
        megaMenuButton.removeEventListener('pointerdown', toggleMegaMenu);
      }
    };
  }, [isHamburgerMenuOpen]);

  useEffect(() => {
    const hamburgerButton = document.getElementById('hamburger-button');
    hamburgerButton?.addEventListener('click', toggleHamburgerMenu);

    return () => {
      hamburgerButton?.removeEventListener('click', toggleHamburgerMenu);
    };
  }, []);

  return (
    <>
      {isHamburgerMenuOpen && (
        <div className="hamburger-menu">
        <div className="flex flex-col items-center space-y-4">
          {userSignedIn ? (
            <>
              <a href="#" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300" id="mega-menu-button-mobile" >ジャンル一覧</a>
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
