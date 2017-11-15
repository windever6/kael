class AuthController < ApplicationController
	skip_before_action :ensure_authenticated_user, only: %i( index login )

	def index
		render :login
	end

  def login
  	user_id = User.find_by(name: params[:user][:name]).try(:id)
  	authenticate_user(user_id)
  	flash[:notice] = '用户不存在' unless user_id
    redirect_to root_url
  end
end
