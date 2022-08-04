class User < ApplicationRecord
	has_one :account
	enum gender: { male: 0, female: 1}
	enum user_type: { client: 0, end_user: 1 }
	validates :email, uniqueness: true

	after_create :create_user_account

	private

	def create_user_account
		account = build_account
		account.save!
	end
end
