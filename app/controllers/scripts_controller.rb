class ScriptsController < ApplicationController
	respond_to :json

	def index
		p params
		scripts = Lesson.find(params[:lesson_id]).scripts

		render :json => scripts.to_json
	end
end
