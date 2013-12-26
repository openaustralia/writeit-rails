require 'models/message'
require "models/writeitinstance"

describe Message do
  context "with attributes" do
    it "has subject content" do
      message = Message.new
      message.subject = "Hey this is a subject"
      message.content = "Hey this is a content"
      message.subject.should eql "Hey this is a subject"
      message.content.should eql "Hey this is a content"
    end
    it "can have a writeitinstance" do
      message = Message.new
      message.subject = "subject"
      message.content = "content"
      writeitinstance = WriteItInstance.new
      writeitinstance.url = '/instances/1/'

      message.writeitinstance = writeitinstance

      message.writeitinstance.should eql writeitinstance
    end
  end
end
