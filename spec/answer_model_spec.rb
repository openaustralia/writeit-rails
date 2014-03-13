require "writeit-rails"
require "spec_helper"
require 'json'

describe Answer do
	context "the attributes" do
		it "it has content, person, message and created date" do
			message = Message.new


			answer = Answer.new

			answer.content = "Hey this is a content"
			answer.person = 'http://localhost:3002/api/persons/5008048c7a317e126400046d'
			answer.message = message
			answer.created_date = DateTime.new(2001,2,3)

			answer.content.should eql "Hey this is a content"
			answer.person.should eql "http://localhost:3002/api/persons/5008048c7a317e126400046d"
			answer.message.should eql message
			answer.created_date.should eql DateTime.new(2001,2,3)
		end
	end
end