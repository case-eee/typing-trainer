require 'spec_helper'
# render_views

describe LanguagesController do

	before do
		@language1 = Language.create(name: 'JavaScript')
		@language2 = Language.create(name: 'Ruby')
		@language3 = Language.create(name: 'Python')	
	end

	describe "#index"

		before do 
			get :index, :format => :json
		end

		it "should retrieve a content-type of json" do
			expect(response.header['Content-Type']).to include "application/json"
		end

		it "should retrieve status code of 200" do
			expect(response.response_code).to eq 200
		end

		it "should retrieve list of languages" do
			languages = Language.all
			expect(languages.count).to eql 3

			expect(response.body).to include(@language1.id.to_s)
			expect(response.body).to include(@language2.id.to_s)
			expect(response.body).to include(@language3.id.to_s)
			expect(response.body).to include('JavaScript')
			expect(response.body).to include('Ruby')
			expect(response.body).to include('Python')
		end

	end


