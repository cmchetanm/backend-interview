class Transaction < ApplicationRecord
	belongs_to :account
	enum status: { debit: 0, credit: 1}
end
