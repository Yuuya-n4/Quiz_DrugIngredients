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
        <div className="flex flex-col items-center space-y-4 py-4">
          {userSignedIn ? (
            <>
              <a href="#" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300" id="mega-menu-button-mobile" ><i className="fa-solid fa-layer-group mr-1.5"></i>ジャンル一覧</a>
              <a href="/quizzes" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300"><i className="fa-solid fa-magnifying-glass mr-1.5"></i>クイズ検索</a>
              <a href="/scores/mypages" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300"><i className="fa-regular fa-rectangle-list mr-1.5"></i>スコアページ</a>
              <a href="/profile/mypages" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300"><i className="fa-solid fa-user-pen mr-1.5"></i>ユーザー情報編集</a>
              <a href="/users/sign_out" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300"><i className="fa-solid fa-right-from-bracket mr-1.5"></i>ログアウト</a>
            </>
          ) : (
            <>
              <a href="/users/sign_up" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300"><i className="fa-regular fa-address-card mr-2"></i>会員登録</a>
              <a href="/users/sign_in" className="text-sm md:text-base ml-4 md:ml-6 hover:text-blue-300"><i className="fa-solid fa-right-to-bracket mr-2"></i>ログイン</a>
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
