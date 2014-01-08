require "writeit-rails/writeitinstance"
require "spec_helper"

describe WriteItInstance do
  context "The creation" do
    it "has a url wich references the remote instance" do
      writeitinstance = WriteItInstance.new
      writeitinstance.url = '/instances/1/'
      writeitinstance.base_url = 'http://localhost:3001'
      writeitinstance.username = 'username'
      writeitinstance.api_key = 'api_key'
      writeitinstance.base_url.should eql 'http://localhost:3001'
      writeitinstance.url.should eql '/instances/1/'
      writeitinstance.username.should eql 'username'
      writeitinstance.api_key.should eql 'api_key'
    end
  end
  context "Validation" do
    it "passes when the instance exists" do
      writeitinstance = WriteItInstance.new
      #this instance does not exist
      writeitinstance.url = '/instance/1/'
      #this instance does not exist
      writeitinstance.base_url = 'http://localhost:3001'
      writeitinstance.username = 'admin'
      writeitinstance.api_key = 'a'

      writeitinstance.validate().should be true
      
    end
    it "fails when the instance does not exist" do
      writeitinstance = WriteItInstance.new
      #this instance does not exist
      writeitinstance.url = '/instances/2/'
      #this instance does not exist
      writeitinstance.base_url = 'http://localhost:3001'
      writeitinstance.username = 'admin'
      writeitinstance.api_key = 'a'

      writeitinstance.validate().should be false
      writeitinstance.errors.should include("404 Resource Not Found")
    end

    it "fails when it is not the owner" do
      writeitinstance = WriteItInstance.new
      #this instance does not exist
      writeitinstance.url = '/instance/1/'
      #this instance does not exist
      writeitinstance.base_url = 'http://localhost:3001'
      #wrong user and api_key
      writeitinstance.username = 'adminaa'
      writeitinstance.api_key = 'aaa'

      writeitinstance.validate().should be false
      writeitinstance.errors.should include("401 Unauthorized")
    end
  end
end