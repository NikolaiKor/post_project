class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  layout 'main_layout'

end
