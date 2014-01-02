require 'models/message'
require "models/writeitinstance"
require 'json'

describe Message do
  context "with attributes" do
    it "has author_name, author_email,subject, remote_id, remote_uri and content" do
      message = Message.new
      message.subject = "Hey this is a subject"
      message.content = "Hey this is a content"
      message.author_name = "Fiera feroz"
      message.author_email = "fiera@ciudadanointeligente.org"
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
    before(:each) do
      @writeitinstance = WriteItInstance.new
      @writeitinstance.url = '/api/v1/instance/1/'
      @writeitinstance.base_url = 'http://127.0.0.1.xip.io:3001'
      @writeitinstance.username = 'admin'
      @writeitinstance.api_key = 'a'
    end
    it "pushes to the API" do
      message = Message.new
      message.subject = "this is the subject"
      message.content = "this is the content"
      message.author_name = "Fiera"
      message.author_email = "fiera@ciudadanointeligente.org"
      message.writeitinstance = @writeitinstance
      message.recipients = ['http://localhost:3002/api/persons/5008048c7a317e126400046d', 'http://localhost:3002/api/persons/500804717a317e126400005e']
      message.push_to_api


      message.remote_id.should_not be_nil
      message.remote_uri.should_not be_nil

      #Here comes the biggest assert
      response = RestClient.get @writeitinstance.base_url + message.remote_uri ,
       {:params => {:format => 'json', 
        'username' => @writeitinstance.username, 
        'api_key' => @writeitinstance.api_key}}
      response.code.should equal 200
      created_message = JSON.parse(response.body)
      created_message['content'].should eql "this is the content"
      created_message['subject'].should eql "this is the subject"
      created_message['author_name'].should eql "Fiera"
      created_message['author_email'].should eql "fiera@ciudadanointeligente.org"

    end
    it "raises error when no recipients" do
      message = Message.new
      message.subject = "this is the subject"
      message.content = "this is the content"
      message.author_name = "Fiera"
      message.author_email = "fiera@ciudadanointeligente.org"
      message.writeitinstance = @writeitinstance

      #I haven't even created the recipients thing

      expect { message.push_to_api }.to raise_error(ArgumentError, "No recipients, please add some first")

      #look empty
      message.recipients = []

      expect { message.push_to_api }.to raise_error(ArgumentError, "No recipients, please add some first")

    end
  end


end
