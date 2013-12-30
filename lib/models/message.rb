require 'active_record'

class Message
    attr_accessor :subject
    attr_accessor :content
    attr_accessor :writeitinstance
    attr_accessor :recipients
    attr_accessor :remote_uri
    attr_accessor :remote_id
    def push_to_api
      self.remote_id = 1
      self.remote_uri = '/message/1/'
    end

end