module Api
    class RatingsController < ApplicationController
      before_action :authenticate_user!
  
      def create
        # ユーザーIDとクイズIDで既存の評価を検索、なければ新しく初期化
        rating = current_user.ratings.find_or_initialize_by(quiz_id: rating_params[:quiz_id])
        rating.score = rating_params[:score]
  
        if rating.save
          render json: { status: 'success', rating: rating }
        else
          render json: { status: 'error', errors: rating.errors.full_messages }
        end
      end

      def show
        rating = current_user.ratings.find_by(quiz_id: params[:quiz_id])
        if rating
          render json: { rating: rating }
        else
          render json: { rating: nil }
        end
      end
  
      private
  
      def rating_params
        params.require(:rating).permit(:quiz_id, :score)
      end
    end
  end