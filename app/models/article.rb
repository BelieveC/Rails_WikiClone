class Article < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	belongs_to :category

	validates :title, presence: true,length: {minimum: 5}
	validates :content, presence: true
end
