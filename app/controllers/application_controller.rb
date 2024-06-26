class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  NotAuthenticated = Class.new(StandardError)

  rescue_from NotAuthenticated, with: :not_authenticated

  def record_not_found
    flash[:notice] = "Registro não encontrado"

    redirect_to action: "index"
  end

  def not_authenticated
    flash[:notice] = "Você precisa se autenticar no sistema"

    redirect_to login_path
  end

  def current_user
    return unless session[:id]

    @current_user ||= User.find(session[:id])
  end

  def logged?
    raise NotAuthenticated unless session[:id]
  end
end
