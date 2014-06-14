class LanguagesController < ApplicationController
	respond_to :json

	def index
		languages = Language.all

		render :json => languages.to_json
	end
end
