class LessonsController < ApplicationController
	respond_to :json

	def index
		p params
		lessons = Language.where(name: params[:track_name]).first.lessons

		render :json => lessons.to_json
	end

	def user_tracks
		lessons = []
		tracks = Track.where(user_id: current_user.id)
		tracks.each do |track|
			lessons << track.lesson			
		end

		render :json => lessons.to_json
	end
end