require 'spec_helper'

describe Script do
	describe "Migration" do
		it { should have_db_column(:text) }
		it { should have_db_column(:lesson_id) }
		it { should have_db_column(:sub_difficulty) }
	end

	describe "Associations" do
		it { should belong_to(:lesson) }
		it { should have_many(:performances) }
	end

end
