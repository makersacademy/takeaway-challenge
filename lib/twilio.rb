require 'rubygems'
require 'twilio-ruby'

class Texter
  def initialize(client_class = Twilio::REST::Client)
    @client = client_class.new ENV['id'], ENV['token']
    #it should create a twilio_client
  end

  def send(message)
    new_client.messages.create(from: @from, to: @to, body: message)
  end

  private
  def environment
    @from = ENV["from"]
    @account_sid = ENV["account_sid"]
    @auth_token = ENV["auth_token"]
    @to = ENV["to"]
  end

end
