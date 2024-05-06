class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.auth(params[:email], params[:password])

    raise NotAuthenticated unless @user

    session[:id] = @user.id
    session[:email] = @user.email

    flash[:notice] = "Olá, #{@user.name}"

    redirect_to dashboard_path
  end

  def destroy
    session[:id] = nil

    redirect_to login_path
  end
end
