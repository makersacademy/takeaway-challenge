require "twillo-ruby"
class SMS

    def initialize(client: nil)
      @client = client || Twilio::REST::Client.new
    end

    def deliver

    end

end
