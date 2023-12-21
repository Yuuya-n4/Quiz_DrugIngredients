class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_default_meta_tags, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def set_default_meta_tags
      case controller_name
      when 'passwords'
        case action_name
        when 'new'
          set_meta_tags title: 'パスワード忘れ',
                      site: 'クイズ!市販薬の成分',
                      reverse: true
        when 'edit'
          set_meta_tags title: 'パスワード変更',
                      site: 'クイズ!市販薬の成分',
                      reverse: true
        end
      when 'registrations'
        case action_name
        when 'new'
          set_meta_tags title: '会員登録',
                      site: 'クイズ!市販薬の成分',
                      reverse: true
        end
      when 'sessions'
        if action_name == 'new'
          set_meta_tags title: 'ログイン',
                      site: 'クイズ!市販薬の成分',
                      reverse: true
        end
      else
      set_meta_tags title: 'クイズ',
                    site: 'クイズ!市販薬の成分',
                    reverse: true,
                    charset: 'utf-8',
                    description: '薬に興味のある人がクイズ形式で楽しく知って学べるサービスです。',
                    keywords: '薬, クイズ、成分, 市販薬, 登録販売者, 風邪薬, 胃腸薬, 皮膚薬, 目口鼻, 滋養強壮, 漢方薬',
                    og: {
                      title: :title,
                      type: 'website',
                      site_name: 'クイズ!市販薬の成分'
                    }
    end
  end
end
