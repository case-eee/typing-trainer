class LessonsController < ApplicationController
	respond_to :json

	def index
		p params
		lessons = Language.where(name: params[:track_name]).first.lessons

		render :json => lessons.to_json
	end
end