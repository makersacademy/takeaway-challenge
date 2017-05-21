require_relative 'order'
require_relative 'inputoutput'
require 'twilio-ruby'

class InputOutput
  attr_reader :reader

  def initialize
    @reader

  end

  def print_to_terminal(output)
       print output
  end

  def get_input
    reader = gets.chomp
  end

  def send_text
    @client = Twilio::REST::Client.new 'ACe7d365ffa7e34117145ddfafd390d01d', 'a4dd107057b04723d30b432ee2cd1db8'
    message = @client.account.messages.create(:body => "Your order is on its way and will be there soon",
        :to => "+447816139888",
        :from => "441643870037")
  end

end
