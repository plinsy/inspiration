# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def done
	print "."
end
def seedend
	puts "~> Success!"
end

admin = User.new(
	email: ENV['EMAIL'], 
	username: ENV['USERNAME'], 
	firstname: ENV['FIRSTNAME'], 
	lastname: ENV['LASTNAME'], 
	birthdate: DateTime.parse(ENV['BIRTHDATE']), 
	password: ENV['PASSWORD'], 
	password_confirmation: ENV['PASSWORD'], 
	admin: true, role: "admin"
)
admin.skip_confirmation!
admin.save!
done

(0..25).step(1) do |n|
	user = User.create(
		email: "plinsy#{n}@yopmail.com", 
		username: "Linx#{n}", 
		firstname: "Princy#{n}", 
		lastname: "#{n}A.N.Tsimanarson", 
		birthdate: DateTime.parse(ENV['BIRTHDATE']), 
		password: "000000", 
		password_confirmation: "000000"
	)
	user.skip_confirmation!
	user.save!
	10.times do |i|
		conversation = Conversation.create(name: "conv#{n}#{i}", user: user)
	end
end

seedend