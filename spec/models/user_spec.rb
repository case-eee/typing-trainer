require 'spec_helper'

describe User do
	 describe "Migration" do
  	it { should have_db_column(:username)}
  	it { should have_db_column(:email)}
  	it { should have_db_column(:password)}
  end

  describe "Association" do
  	it { should have_many(:performances) }
  	it { should have_many(:tracks) }
  	it { should have_many(:lessons).through(:tracks) }
  end

end
