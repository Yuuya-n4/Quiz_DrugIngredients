class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_default_meta_tags, only: [:scores, :profile]

  def scores
    set_meta_tags title: 'スコア確認'
    @scores = current_user.scores.includes(:quiz_set).order(created_at: :desc).page(params[:page]).per(10)
  end

  def profile
    set_meta_tags title: 'プロフィール'
    @user = current_user
  end

  def update_profile
    @user = current_user

    if user_params[:password].blank?
      successfully_updated = @user.update_without_password(user_params.except(:password, :password_confirmation, :current_password))
    else
      successfully_updated = @user.update_with_password(user_params)
    end

    if successfully_updated
      bypass_sign_in(@user) if user_params[:password].present?
      redirect_to profile_mypages_path, notice: 'プロフィールを更新しました。'
    else
      render :profile
    end
  end

  private

  def user_params
    permitted_params = [:name, :email, :gender, :age]
    if params[:user][:password].blank?
      params.require(:user).permit(*permitted_params)
    else
      params.require(:user).permit(*permitted_params, :password, :password_confirmation, :current_password)
    end
  end
end
