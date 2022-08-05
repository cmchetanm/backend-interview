class User < ApplicationRecord
	enum gender: { male: 0, female: 1}
	enum user_type: { standard: 0, gold: 1, platinum: 2 }
	
	has_one :account, dependent: :destroy
	has_and_belongs_to_many :rewards
	belongs_to :client, class_name: 'User', foreign_key: :client_id, optional: true
  has_many :customers, class_name: 'User', foreign_key: :client_id, dependent: :destroy

	validates :email, uniqueness: true
	validates :full_phone_number, uniqueness: true, presence: true
	validate :valid_phone_number

	before_validation :parse_full_phone_number
	after_create :create_user_account

	private

	def valid_phone_number
	  errors.add(:full_phone_number, 'Invalid or Unrecognized Phone Number') unless Phonelib.valid?(full_phone_number)
	end

	def parse_full_phone_number
    phone = Phonelib.parse(full_phone_number)
    self.full_phone_number = phone.sanitized
    self.country_code      = phone.country_code
    self.phone_number      = phone.raw_national
  end

	def create_user_account
		account = build_account
		account.save!
	end
end
