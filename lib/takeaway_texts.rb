require 'twilio-ruby'

class Takeawaytext
  def initialize
    @sid = "ACcbff53aca0c4f1f420d4a654c86a08ee"
    @token = "2e545b68cb34cbcb47d34195a2f952b7"
    @from = '441744582044'
  end

  def call(num = '+447479365828', name = 'POTATO DRAGON')
    @client = Twilio::REST::Client.new @sid, @token
    frondz = { num => name }
    frondz.each do |key, value|
      message = @client.account.messages.create(
                                            :from => @from,
                                            :to => key,
                                            :body => "1 #{value} coming right up"
                                            )
      puts "YEAH BITCH, FOOD"
    end
  end
end

# a = TakeawayText.new
# a.call
