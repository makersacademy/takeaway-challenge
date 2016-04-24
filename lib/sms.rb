require 'twilio-ruby'
require 'pry'
require 'yaml'

class SMS

  TIME_FORMAT = "%H:%M"

  def initialize(config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config || YAML.load_file('config.yml')
  end

  def deliver
    client.messages.create(args)
  end

  private

    attr_reader :config, :client

    def args
      {
        from: config['from'],
        to: config['to'],
        body: config['body'] % delivery_time
      }
    end

    def delivery_time
      (Time.now + 60 * 60).strftime(TIME_FORMAT)
    end
end
