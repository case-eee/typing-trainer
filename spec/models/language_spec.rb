require 'spec_helper'

describe Language do
  describe "Migration" do
  	it { should have_db_column(:name) }
  end

  describe "Association" do
  	it { should have_many(:lessons) }
  end
end
