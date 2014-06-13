require 'spec_helper'

describe Performance do
	describe "Migration" do
		it { should have_db_column(:number_missed) }
		it { should have_db_column(:total_characters) }
		it { should have_db_column(:time_elapsed) }
		it { should have_db_column(:wpm) }
		it { should have_db_column(:script_id) }
		it { should have_db_column(:user_id) }
	end

	describe "Association" do
		it { should belong_to(:user) }
		it { should belong_to(:script) }
	end

end
