class Transaction < ApplicationRecord
	belongs_to :account
	enum status: { debit: 0, credit: 1}

	before_create :check_balance

	private

	def check_balance
		balance = account.balance.to_f
		if balance < amount.to_f
			errors.add(:account, "balance is not sufficient")
		else
			account.update(balance: (balance - amount.to_f))
		end
	end
end
