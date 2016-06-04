require 'twilio-ruby'
require 'sinatra'
require 'dotenv'
Dotenv.load


class Order

  def initialize
    @total = ''
    @selected_items = []
  end

  def sum_items(user_selected_items)
    @selected_items = user_selected_items
    values = extract_values_from_items( user_selected_items )
    fail message if values.any? {|value| value.to_f < 0}
    @total = '%.2f' % values.map(&:to_f).reduce(0, :+)
  end

  def receipt
    send_text
    formatted_receipt
  end

  private

  #CURRENTLY EXPERIMENTING, a couple of class extractions needed here
  #potentially a receipt and text class.

  def formatted_receipt
    @receipt = <<-EOM

    The Fat Duck Restaurant
    #{@selected_items.sort.to_yaml}
    Total: #{('£'+@total).to_yaml}

    Thank you! Your order was placed and
    will be delivered before #{(Time.now+(60*60)).strftime('%r')}

    SERVICE NOT INCLUDED
    #{Time.now.strftime("%A %B %d %r")}

    EOM
  end

  def message
    "Error! Sum total is incorrect!"
  end

  def send_text
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_NUMBER']

    friends = {
    ENV['MY_NUMBER'] => "Alex"
    }
    friends.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => "Thank you! Your order was placed and will be delivered before #{(Time.now+(60*60)).strftime('%r')}"
      )
    end
  end

  def extract_values_from_items(user_selected_items)
    user_selected_items.map{ |item| item.scan(/([-]*\d+.\d+)$/) }.flatten
  end
end







