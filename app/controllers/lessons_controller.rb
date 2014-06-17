class LessonsController < ApplicationController
	respond_to :json

	def index
		p params
		lessons = Language.where(name: params[:track_name]).first.lessons

		render :json => lessons.to_json
	end

	def tracks
		lsns = []
		da_tracks = Track.where(user_id: current_user.id)
		da_tracks.each { |track| lsns << track.lesson}
		render :json => lsns.to_json
	end

end