class Account < ApplicationRecord
	belongs_to :user
	has_many :transactions
	has_many :points, dependent: :destroy
end
