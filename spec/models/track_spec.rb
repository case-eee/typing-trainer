require 'spec_helper'

describe Track do
	describe "Migration" do
		it { should have_db_column(:user_id) }
		it { should have_db_column(:lesson_id) }
	end

	describe "Association" do
		it { should belong_to(:user) }
		it { should belong_to(:lesson) }
	end

end
