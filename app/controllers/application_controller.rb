class ApplicationController < ActionController::Base
  include Banken
  protect_from_forgery
  before_action :require_login

  rescue_from Banken::NotAuthorizedError, with: :person_not_authorized

  private

  def not_authenticated
    redirect_to login_path,alert: "Please login first"
  end

  def person_not_authorized(exception)
    loyalty_name = exception.loyalty.class.to_s.underscore

    flash[:error] = t "#{loyalty_name}.#{exception.query}", scope: "banken", default: :default
    redirect_to(foods_path)
  end
end
