class TransactionJob
  include Sidekiq::Job

  def perform(*args)
    users = User.where('extract(month from dob) = ?', Time.now.strftime('%m'))
    reward = CreateBirthdayReward.new(users)
    reward.call
  end
end


