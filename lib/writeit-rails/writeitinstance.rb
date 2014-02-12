class WriteItInstance
    attr_accessor :url
    attr_accessor :base_url
    attr_accessor :username
    attr_accessor :api_key
    attr_accessor :per_page
    attr_reader   :errors

    def per_page
        @per_page || 20
    end

    def validate
    	authorization = 'ApiKey %{username}:%{api_key}' % {
            :username => self.username,
            :api_key => self.api_key,
        }

    	url = self.base_url + "/api/v1" + self.url
    	request = RestClient::Request.new(
            :method => :get,
            :url => url,
            :headers => {
                :accept => :json,
                :authorization => authorization,
                }
            )

    	#RestClient::ResourceNotFound
    	begin
    		request.execute
	    rescue Exception => e
	    	@errors = [e.message]

	    	return false
	    end	
    	return true
    end
end