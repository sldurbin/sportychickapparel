class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_instagram_feed

  def get_instagram_feed
    @instagram = Instagram.user_recent_media("631846379", {:count => 3})
  end
end
