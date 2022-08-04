class User < ApplicationRecord
	has_one :account
	enum gender: { male: 0, female: 1}
end
