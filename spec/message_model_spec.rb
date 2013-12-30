require 'models/message'
require "models/writeitinstance"

describe Message do
  context "with attributes" do
    it "has subject, remote_id, remote_uri and content" do
      message = Message.new
      message.subject = "Hey this is a subject"
      message.content = "Hey this is a content"
      message.remote_id = 1
      message.remote_uri = "/message/1/"
      message.subject.should eql "Hey this is a subject"
      message.content.should eql "Hey this is a content"
      message.remote_id.should eql 1
      message.remote_uri.should eql "/message/1/"
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
    it "can have recipients" do
      message = Message.new
      message.recipients = ['recipient 1']
      message.recipients.should_not be_nil
      message.recipients[0].should eql 'recipient 1'
    end

  end
  context "interacting through the API" do
    xit "pushes to the API" do
      message = Message.new
      writeitinstance = WriteItInstance.new
      writeitinstance.url = '/instances/1/'
      writeitinstance.base_url = 'http://localhost:3001'
      writeitinstance.username = 'admin'
      writeitinstance.api_key = 'a'
      message.subject = "this is the subject"
      message.content = "this is the content"
      message.writeitinstance = writeitinstance
      message.recipients = ['http://localhost:3002/api/persons/5008048c7a317e126400046d', 'http://localhost:3002/api/persons/500804717a317e126400005e']
      message.push_to_api
      message.remote_id.should_not be_nil
      message.remote_uri.should_not be_nil
      response = RestClient.get writeitinstance.base_url + '/api/v1' + writeitinstance.url + '?format=json&username=' + writeitinstance.username + '&api_key=' + writeitinstance.api_key
      response.code.should equal 200


    end
  end

end
