require "models/writeitinstance"
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
end