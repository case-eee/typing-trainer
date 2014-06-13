class User < ActiveRecord::Base
	has_many :performances
	has_many :tracks
	has_many :lessons, through: :tracks
end
