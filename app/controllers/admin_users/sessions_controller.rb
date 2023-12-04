class AdminUsers::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      redirect_to rails_admin_path and return
    end
  end
end
