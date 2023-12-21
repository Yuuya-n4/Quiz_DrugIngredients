class PagesController < ApplicationController
  before_action :set_default_meta_tags, only: [:terms, :privacy]

    def terms
      set_meta_tags title: '利用規約'
    end
  
    def privacy
      set_meta_tags title: 'プライバシーポリシー'
    end
  end