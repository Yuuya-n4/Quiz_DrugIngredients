require Rails.root.join('lib', 'quiz_diagram')
RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    quiz_diagram

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.main_app_name = Proc.new { |controller| [I18n.t("admin.app_name"), I18n.t("admin.app_subtitle")] }

  config.model 'AdminUser' do
    weight 1
  end
  config.model 'User' do
    weight 2
  end
  config.model 'QuizSet' do
    weight 3
  end
  config.model 'Quiz' do
    weight 4
  end
  config.model 'Choice' do
    weight 5
  end
  config.model 'Score' do
    weight 6
  end
  config.model 'UserQuizPerformanceSummary' do
    weight 7
  end
  config.model 'Rating' do
    weight 8
  end
  config.model 'Feedback' do
    weight 9
  end

  config.model 'Quiz' do
    edit do
      field :question
      field :explanation
      field :drug_type
      field :quiz_set
      field :choices do
        nested_form false
      end
    end
  end

  config.authenticate_with do
    warden.authenticate! scope: :admin_user
  end
  config.current_user_method(&:current_admin_user)
end
