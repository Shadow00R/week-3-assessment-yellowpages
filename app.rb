# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
require_relative 'app/models/yellowpage'
require 'sqlite3'
require 'byebug'

# Your Code begins from this line onwards #

# def reload
# 	id.reload
# # end

def listing
	entries = Yellowpage.all

puts "=====PAGES OF GREEN INSTEAD====="
	entries.each do |a|
		puts "#{a.id}, #{a.name}, #{a.phone}, #{a.address}"
	end
end


def add(name,phone,address)

Yellowpage.create(name: name, phone: phone, address: address)

puts "Entry #{name}, #{phone}, #{address} has been added."
end


def update(id, name, phone, address)

	# all_id = []
	entryU = Yellowpage.where(id: id) #do |x|
		# all_id << x.id
		# end		
		if entryU.count != 0
			entryUp = Yellowpage.find(id)
			entryUp.update(name: name, phone: phone, address: address)
			# g = Yellowpage.where(id: id)
			# person = g[0]
			# person.name = name
			# person.phone = phone
			# person.address = address
			# person.save
		else
			puts "The ID you were looking for is unavailable. Please try again."
		end

end

def delete(id)
	
	entryD = Yellowpage.where(id: id) #do |q|
	p entryD
	if entryD.count != 0
		entryDes = Yellowpage.find(id)
		entryDes.destroy
	else
		puts "The ID you were looking for is unavailable. Please try again."
	end

end

if ARGV[0] == "listing"
	p listing
elsif ARGV[0] == "add"
	add(ARGV[1],ARGV[2],ARGV[3])
elsif ARGV[0] == "update"
	update(ARGV[1],ARGV[2],ARGV[3],ARGV[4])
elsif ARGV[0] == "delete"
	delete(ARGV[1])
end

# delete(7)
# # update("4", "Rory", "845478941", "43, Stratostrasse, Munich")
# # add("Tails", "8457550822", "32, LightStrasse, Gumpert")
# listing
# # app = Model.new
# # app.to_s