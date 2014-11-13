class WelcomeController < ApplicationController
  def index
	@lat = 40.7127
	@lng = -74.0059
	@has_session_location = false

	
	if session[:current_position_array] && ! session[:current_position_array].empty?

		@has_session_location = true
		@lat = session[:current_position_array][0]
		@lng = session[:current_position_array][1]

	end

  end

  def update_user_session_location
	render nothing: true
	if params[:current_position_array]
		session[:current_position_array] = params[:current_position_array]
	end
  end

end
