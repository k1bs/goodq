# question model
class Question < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates_presence_of :question, :score
end
