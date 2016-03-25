class Article < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	validates :title, presence: true,length: {minimum: 5}
	validates :content, presence: true
end
