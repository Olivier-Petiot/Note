class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates_numericality_of :rating, less_than_or_equal_to: 5
  validates_numericality_of :rating, greater_than_or_equal_to: 0
end
