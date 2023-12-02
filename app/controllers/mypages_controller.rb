class MypagesController < ApplicationController
  before_action :authenticate_user!

  def scores
    @scores = current_user.scores.includes(:quiz_set)
  end

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user

    # パスワードの入力があればパスワードも更新する
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
    if params[:user][:password].blank?
      params.require(:user).permit(:name, :email)
    else
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end
end
