require 'twilio-ruby'

class Takeaway

  attr_reader :preparing

  def initialize menu
    @menu = menu
    @preparing = []
  end

  def order dishes, quantities, total
    might_prepare = dishes.zip(quantities)
    raise "Not totalling to expected" unless (bill_comes_to might_prepare) == total
    @preparing = might_prepare
  end

  def bill_comes_to order
    bill = order.map { |dish,quantity| quantity * @menu.content[dish]}
    total = bill.inject { |sum,n| sum + n }
    total
  end

  def send_message client
    #client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    client.account.messages.create({
            from: ENV['twilio_number'],
            to: ENV['mobile'],
            body: "Thank you! Your order was placed and will be delivered before #{time}"
      })
  end

  private

  def time
    time = Time.new
    delivered_by = time + 60*60
    delivered_by.strftime("%I:%M%p")
  end

end
