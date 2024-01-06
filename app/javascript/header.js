import React from 'react';
import { createRoot } from 'react-dom/client';
import MegaMenu from './components/MegaMenu';

let root = null;

document.addEventListener('DOMContentLoaded', () => {
  const hamburgerButton = document.getElementById('hamburger-button');
  const menuContainer = document.getElementById('menu-container');
  const megaMenuButton = document.getElementById('mega-menu-button');
  const megaMenuButtonPC = document.getElementById('mega-menu-button-pc');
  const megaMenuContainer = document.getElementById('header-menu-container');
  let isMegaMenuOpen = false;
  let isHamburgerMenuOpen = false;

  const createMegaMenuRoot = () => {
    if (!root) {
      root = createRoot(megaMenuContainer);
    }
    root.render(<MegaMenu onClose={() => {
      isMegaMenuOpen = false;
    }} />);
  };

  const toggleMenuContainer = () => {
    if (isMegaMenuOpen) {
      // メガメニューが開いている場合、それを閉じる
      toggleMegaMenu();
    }
    menuContainer.classList.toggle('hidden');
    isHamburgerMenuOpen = !menuContainer.classList.contains('hidden');
  };

  const toggleMegaMenu = () => {
    if (isHamburgerMenuOpen) {
      // ハンバーガーメニューが開いている場合、それを閉じる
      toggleMenuContainer();
    }
    megaMenuContainer.classList.toggle('hidden');
    isMegaMenuOpen = !megaMenuContainer.classList.contains('hidden');
    if (!root && isMegaMenuOpen) {
      createMegaMenuRoot();
    }
  };

  const toggleMegaMenuPC = () => {
    megaMenuContainer.classList.toggle('hidden');
    isMegaMenuOpen = !megaMenuContainer.classList.contains('hidden');
    if (!root && !isMegaMenuOpen) {
      root = createRoot(megaMenuContainer);
      root.render(<MegaMenu />);
    }
    createMegaMenuRoot();
  };

  if (hamburgerButton && menuContainer) {
    hamburgerButton.addEventListener('click', toggleMenuContainer);
  }

  if (megaMenuButton) {
    megaMenuButton.addEventListener('click', (event) => {
      event.preventDefault();
      toggleMegaMenu();
    });
  }
  
  if (megaMenuButtonPC) {
    megaMenuButtonPC.addEventListener('click', (event) => {
      event.preventDefault();
      toggleMegaMenuPC();
    });
  }
});