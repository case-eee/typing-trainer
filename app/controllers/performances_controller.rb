class PerformancesController < ApplicationController
	respond_to :json

	def create
		incorrect_characters = params[:new_performance][:missed_characters]
		puts incorrect_characters
		most_missed = {}

		if user_signed_in? 
			new_performance = current_user.performances.new(performance_params)
			if new_performance.save
				if incorrect_characters.length >= 1
					most_missed[:character] = incorrect_characters.split(",").group_by(&:to_s).values.max_by(&:size).try(:first)
					most_missed[:times] = incorrect_characters.group_by(&:to_s).values.max_by(&:size).length
					render :json => most_missed.to_json, status: 200
				else 
					most_missed = 'NOTHING!'
					render :json => most_missed.to_json, status: 200
				end
			end
		else
			new_performance = Performance.create(performance_params)
			if incorrect_characters.length >= 1
				most_missed[:character] = incorrect_characters.split(",").group_by(&:to_s).values.max_by(&:size).try(:first)
				most_missed[:times] = incorrect_characters.group_by(&:to_s).values.max_by(&:size).length
				render :json => most_missed.to_json, status: 200
			else 
				most_missed = 'NOTHING!'
				render :json => most_missed.to_json, status: 200
			end
		end
	end

	private

	def performance_params
		params.require(:new_performance).permit(:number_missed, :total_characters, :time_elapsed, :wpm, :script_id, :missed_characters)
	end

end
