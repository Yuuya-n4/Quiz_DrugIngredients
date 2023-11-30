class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz_set, only: [:show, :answer, :explanation]
  before_action :set_quiz, only: [:show, :answer, :explanation]

  def show
    @choices = @quiz.choices
  end

  def answer
    choice = Choice.find(params[:choice_id])
    correct = @quiz.correct_choice?(choice)
    score_record = current_user.scores.find(session[:score_id])
    score_record.correct_answer += 1 if correct
    score_record.save!

    redirect_to explanation_quiz_set_quiz_path(@quiz_set, @quiz)
  end

  def explanation
    @next_quiz = @quiz_set.quizzes.where('id > ?', @quiz.id).first
  end

  def index
    @q = Quiz.ransack(params[:q])
    @quizzes = @q.result(distinct: true).order(:created_at)
  end

  def autocomplete
    @quizzes = Quiz.ransack(question_cont: search_query).result.limit(10)
    render json: @quizzes.map(&:question)
  end


  def search
    query = params[:query]

    quizzes_scope = Quiz.eager_load(:quiz_set, :choices)
                        .where('quizzes.question LIKE :query OR choices.text LIKE :query OR quizzes.explanation LIKE :query OR quiz_sets.title LIKE :query', query: "%#{query}%")
                        .references(:quiz_set, :choices)
  
    quizzes = quizzes_scope.select('quizzes.id, quizzes.question, quizzes.explanation, quiz_sets.title, quiz_sets.id AS quiz_set_id, choices.text, choices.correct').distinct

    results = quizzes.map do |quiz|
      correct_choice = quiz.choices.detect(&:correct)
      {
        question: quiz.question,
        correct_answer: correct_choice&.text,
        explanation: quiz.explanation,
        quiz_set_title: quiz.quiz_set&.title
      }
    end
  
    render json: results
  end


  private

  def set_quiz_set
    @quiz_set = QuizSet.find(params[:quiz_set_id])
  end

  def set_quiz
    @quiz = @quiz_set.quizzes.find(params[:id])
  end
end
