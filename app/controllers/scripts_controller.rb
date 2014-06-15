class ScriptsController < ApplicationController
	respond_to :json

	def index
		p params
		scripts = Script.all

		render :json => scripts.to_json
	end

	def show
		p params
		current_script = Script.find(params[:script_id])

		render :json => current_script.to_json
	end
end
