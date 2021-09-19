class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  def ensure_session_is_enabled!
    if !session.respond_to?(:enabled?) || session.enabled?
      false
    end
  end
end