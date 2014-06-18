class PerformancesController < ApplicationController
	respond_to :json

	def user_performances
		perfs = Performance.where(user_id: current_user.id)#.to_json, status: 200
		array_of_perfs = []
		perfs.each do |perf|
			array_of_perfs << {x: perf.id, y: perf.wpm, size: perf.total_characters}
		end
		p array_of_perfs
		render :json => array_of_perfs.to_json, status: 200
	end

	def create
		if user_signed_in? 
			new_performance = current_user.performances.new(performance_params)
			if new_performance.save
				incorrect_characters = params[:new_performance][:missed_characters].split(",")
				most_missed = {}
				most_missed[:character] = incorrect_characters.group_by(&:to_s).values.max_by(&:size).try(:first)
				most_missed[:times] = incorrect_characters.group_by(&:to_s).values.max_by(&:size).length
				# current_script = Script.find(params[:new_performance][:script_id])
				render :json => most_missed.to_json, status: 200
			end
		else
			new_performance = Performance.create(performance_params)
			incorrect_characters = params[:new_performance][:missed_characters].split(",")
			most_missed = {}
			most_missed[:character] = incorrect_characters.group_by(&:to_s).values.max_by(&:size).try(:first)
			most_missed[:times] = incorrect_characters.group_by(&:to_s).values.max_by(&:size).length
			# current_script = Script.find(params[:new_performance][:script_id])
			render :json => most_missed.to_json, status: 200
		end
	end

	private

	def performance_params
		params.require(:new_performance).permit(:number_missed, :total_characters, :time_elapsed, :wpm, :script_id, :missed_characters)
	end

end
