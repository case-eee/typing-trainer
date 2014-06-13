require 'spec_helper'

describe Lesson do
  describe "Migration" do
  	it { should have_db_column(:language_id)}
  	it { should have_db_column(:difficulty_level)}
  end

  describe "Association" do
  	it { should have_many(:scripts) }
  	it { should have_many(:tracks) }
  	it { should have_many(:users).through(:tracks) }
  end
end
