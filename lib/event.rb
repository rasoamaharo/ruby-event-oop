require 'time'
class Event
	attr_accessor :start_date ,:length ,:title ,:attendees

	def initialize(t, l, ttl, att)
		@start_date = Time.parse(t)
		@length = l.to_i
		@title = ttl
		@attendees = att 
	end
	def postpone_24h
		@start_date +=  24 * 60 * 60
	end
	def end_date 
		@start_date += @length * 60
	end
	def is_past
		if @start_date < Time.now 
			puts "The event in #{start_date} has been past"
		end
	end
	def is_future
		if !self.is_past
			puts "The event in #{start_date} will be come."
		end
	end
	def is_soon
		if (@start_date - Time.now)/60 <=  30
			return true
		else
			return false
		end 
	end
	def to_s
		puts "Title: #{title}"
		puts "Start_date: #{start_date}"
		puts "Durée: #{length} minutes."
		puts "Invité: #{attendees.join(", ")} "
	end

end
class EventCreator
	attr_accessor :start_date, :length, :title, :attendees, :get_date
	def initialize
		# Ask the title of the event
		puts("Hi, do you want to create an event? Cool! \nlet's start, what is the name of the event ?")
		print("> ")
		@title = gets.chomp()
		# Ask the place
		puts("Super, When is it ?")
		print("> ")
		@get_date = gets.chomp()
		@start_date = Time.parse(@get_date)
		# Ask the length of the appoitement
		puts("how long in minutes will it last ?")
		print("> ")
		@length = gets.chomp().to_i
		# list of the mail of the attendees
		puts("Great, who will participate? what is their emails")
		print("> ")
		@attendees = gets.chomp()
		# word of saying goodbye
		puts("Super, soon!")
	end
	def title
		return @title
	end
	def start_date
		return @start_date
	end
	def length
		return @length
	end
	def attendees
		return @attendees
	end
end
class DateParser
	attr_accessor :date, :getting
  def initialize(the_date)
	@getting = the_date.split(", ")
	if @getting[1] == "next"
		if @getting[3] ==  "9h"
			@date = Time.parse("2019-01-28 9:00")
		end
	end
	if @getting[1] == "14"
		if @getting[2] == "october"
			if @getting[4] == "15h"
				@date = Time.parse("2019-10-14 15:00")
			end
		end
	end
  
end
class CalendarDisplayer
	attr_accessor :month, :day, :event, :hour, :length
	@@month = ["january", "february", "march", "april", "may", "june", "july", "August", "september", "october", "november", "december"]
	@@days = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
	def initialize(the_month)
		@month = the_month.to_a
	end
	def event(the_day, the_hour, the_event)
		@day = the_day
		@hour = the_hour
		@event = the_event
	end
	def show(the_month, length)
		@length = length
		@@days.each do |i|
			print "  " + @@days[i] + "    "
		end
		print "-----------" * 7
		for j in 1..length
		@@days.each do |i|
			puts "|" + i + "      "
		end
		print "-----------" * 7
		puts "\n"
	end
end