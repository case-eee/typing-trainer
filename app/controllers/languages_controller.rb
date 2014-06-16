class LanguagesController < ApplicationController
  before_action :authenticate_user!
	respond_to :json

	def index
		languages = Language.all

		render :json => languages.to_json
	end
end
