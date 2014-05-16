class Adventure < ActiveRecord::Base
	has_many :pages
	belongs_to :library
end
