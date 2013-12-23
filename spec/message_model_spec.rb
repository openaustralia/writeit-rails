require "models/message"
require 'spec_helper'

describe Message do
  context "with attributes" do
    it "has subject content" do
      message = Message.new
      message.subject = "Hey this is a subject"
      message.content = "Hey this is a content"
      message.subject.should eql "Hey this is a subject"
      message.content.should eql "Hey this is a content"
    end
  end
end
