class TransactionJob
  include Sidekiq::Job

  def perform(*args)
    # Do 
    puts "this is testing"
  end
end
