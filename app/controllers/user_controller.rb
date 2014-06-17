class UserController < ApplicationController
	respond_to :json

	def show
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Got here"
		user = current_user

		render :json => user.to_json
	end
end
