require "models/writeitinstance"

describe WriteItInstance do
  context "The creation" do
    it "has a url wich references the remote instance" do
      writeitinstance = WriteItInstance.new
      writeitinstance.url = '/instances/1/'
      writeitinstance.url.should eql '/instances/1/'
    end
  end
end