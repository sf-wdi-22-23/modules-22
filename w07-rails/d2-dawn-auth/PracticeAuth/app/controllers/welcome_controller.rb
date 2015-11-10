class WelcomeController < ApplicationController
  def index
  	render :index  #optional; this is the default behavior
  	# TODO: change home page view if user is logged in?
  end
end
