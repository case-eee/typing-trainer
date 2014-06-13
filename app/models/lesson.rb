class Lesson < ActiveRecord::Base
	has_many :scripts
	has_many :tracks
	has_many :users, through: :tracks
end
