class TransactionJob
  include Sidekiq::Job

  def perform(*args)
    users = User.where('extract(month from dob) = ?', Time.now.strftime('%m'))
    reward = CreateBirthdayReward.new(users)
    reward.call
    users = User.where(user_type: ["standard", "gold"])
    user_type = CreateUserType.new(users)
    user_type.call
    points = Point.where("DATE(created_at) = ?", 1.year.ago)
    points.destroy_all
    CreatePointAndRewards.new.call
  end
end

