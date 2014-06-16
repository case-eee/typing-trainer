class PerformancesController < ApplicationController
	respond_to :json

	def create
		#if user_signed_in? 
		#	new_performance = current_user.performances.new(performance_params)
		#	if new_performance.save
		#		render :json => new_performance.to_json, status: 200
		#	else
				new_performance = Performance.create(performance_params)
				render :json => new_performance.to_json, status: 200
		#	end
		#end
	end

	private

	def performance_params
		params.require(:new_performance).permit(:number_missed, :total_characters, :time_elapsed, :wpm, :script_id)
	end

end
