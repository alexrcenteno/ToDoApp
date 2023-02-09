class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  # def current_user
  #   auth_headers = request.headers["Authorization"]
  #   if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
  #     token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
  #     begin
  #       decoded_token = JWT.decode(
  #         token,
  #         Rails.application.credentials.fetch(:secret_key_base),
  #         true,
  #         { algorithm: "HS256" }
  #       )
  #       User.find_by(id: decoded_token[0]["user_id"])
  #     rescue JWT::ExpiredSignature
  #       nil
  #     end
  #   end
  # end

  # def authenticate_user
  #   unless current_user
  #     render json: {}, status: :unauthorized
  #   end
  # end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user
    redirect_to "/login", status: :see_other unless current_user
  end
end
