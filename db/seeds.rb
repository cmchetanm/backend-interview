reward1 = {
	name: 'Coffee',
}

reward2 = {
	name: 'Movie Tickets'
}

reward3 = {
	name: 'Airport Lounge Access'
}

client_user = {
	first_name: 'Garima',
	last_name: 'Joshi',
	email: 'garima.joshi@gmail.com',
	address: '76 B, vijay nager, navi mumbai',
	dob: "18-02-1997",
	gender: 'female',
	full_phone_number: 919826098260
}

rewards = [reward1, reward2, reward3]

#Create the rewards
rewards.each do |reward|
	begin
		Reward.create!(reward)
	rescue => e
		puts "#{e}"
	end
end

#Create Client User who can create rewards
begin
	User.create!(client_user)
rescue => e
	puts "#{e}"
end


