class User < ApplicationRecord
	has_one :account
	enum gender: { male: 0, female: 1}
	enum user_type: { client: 0, end_user: 1 }
	validates :email, uniqueness: true
end
