class Reward < ApplicationRecord
  has_and_belongs_to_many :users
  validates :name, uniqueness: true
end
