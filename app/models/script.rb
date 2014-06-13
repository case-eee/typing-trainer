class Script < ActiveRecord::Base
	belongs_to :lesson
	has_many :performances
end
