require "rails_admin/config/actions"
require "rails_admin/config/actions/base"

module RailsAdmin
  module Config
    module Actions
      class QuizDiagram < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :collection? do
          true
        end

        register_instance_option :bulkable do
          true
        end

        register_instance_option :http_methods do
          [:get]
        end

        register_instance_option :link_icon do
          "fas fa-th-list"
        end

        register_instance_option :controller do
          Proc.new do
            @quiz_sets = QuizSet.includes(quizzes: :choices).all
            render @action.template_name
          end
        end
      end
    end
  end
end