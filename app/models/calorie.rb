class Calorie < ApplicationRecord
  belongs_to :user
  validates :number, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
