require 'twilio-ruby'

class TakeawayText
  def initialize
    @sid = "ACcbff53aca0c4f1f420d4a654c86a08ee"
    @token = "2e545b68cb34cbcb47d34195a2f952b7"
    @from = '441744582044'
    @client = Twilio::REST::Client.new @sid, @token
  end

  def call(num = '+447479365828', name = 'POTATO DRAGON', total = 0)
    body_text = "#{name}, OOOOH FOOD, total cost: #{total}"
    message = @client.account.messages.create(
                                              from: @from,
                                              to: num,
                                              body: body_text
    )
    puts "YEAH BITCH, FOOD"
  end
end
