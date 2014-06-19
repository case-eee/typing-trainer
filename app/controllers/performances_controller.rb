class PerformancesController < ApplicationController
	 # before_action :authenticate_user!
	respond_to :json

	def user_performances
		p current_user
		perfs = Performance.where(user_id: current_user.id)#.to_json, status: 200
		array_of_perfs = []
		perfs.each do |perf|
			array_of_perfs << {x: perf.id, y: perf.wpm, size: perf.total_characters}
		end
		p array_of_perfs
		render :json => array_of_perfs.to_json, status: 200
	end

	def create
		incorrect_characters = params[:new_performance][:missed_characters]
		puts incorrect_characters
		most_missed = {}

		# USER
		if user_signed_in? 
			new_performance = current_user.performances.new(performance_params)

			if new_performance.save
				if incorrect_characters == 0
					most_missed[:character] = ""
					most_missed[:times] = 0
					render :json => most_missed.to_json, status: 200
				elsif incorrect_characters.to_s.length > 1
					most_missed[:character] = incorrect_characters.split(",").group_by(&:to_s).values.max_by(&:size).try(:first)
					most_missed[:times] = incorrect_characters.group_by(&:to_s).values.max_by(&:size).length
					render :json => most_missed.to_json, status: 200
				else incorrect_characters.length == 1
					most_missed[:character] = incorrect_characters.split(",").group_by(&:to_s).values.max_by(&:size).try(:first)
					most_missed[:times] = incorrect_characters.split(",").group_by(&:to_s).values.max_by(&:size).length
					render :json => most_missed.to_json, status: 200
				end
			end
		
		# NO USER
		else
			new_performance = Performance.create(performance_params)
			if incorrect_characters == 0
				most_missed[:character] = ""
				most_missed[:times] = 0
				render :json => most_missed.to_json, status: 200
			elsif incorrect_characters.to_s.length > 1
				most_missed[:character] = incorrect_characters.split(",").group_by(&:to_s).values.max_by(&:size).try(:first)
				most_missed[:times] = incorrect_characters.split(",").group_by(&:to_s).values.max_by(&:size).length
				render :json => most_missed.to_json, status: 200
			else incorrect_characters.length == 1
				most_missed[:character] = incorrect_characters.split(",").group_by(&:to_s).values.max_by(&:size).try(:first)
				most_missed[:times] = incorrect_characters.group_by(&:to_s).values.max_by(&:size).length
				render :json => most_missed.to_json, status: 200
			end
		end
	end

	private

	def performance_params
		params.require(:new_performance).permit(:number_missed, :total_characters, :time_elapsed, :wpm, :script_id, :missed_characters)
	end

end
