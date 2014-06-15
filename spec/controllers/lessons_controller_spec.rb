require 'spec_helper'

describe LessonsController do
	before do
		@lesson1 = Lesson.create(difficulty_level: 1, language_id: 5)
		@lesson2 = Lesson.create(difficulty_level: 2, language_id: 1)
	end

	describe '#index'

		before do 
			get :index, :format => :json
		end

		xit "should retrieve a content-type of json" do
			expect(response.header['Content-Type']).to include "application/json"
		end

		xit "should retrieve status code of 200" do
			expect(response.response_code).to eq 200
		end

	end

