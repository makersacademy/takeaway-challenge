require 'twilio-ruby'

class Menu

  attr_reader :dishes, :order

  def initialize
    @dishes = { pizza: 6.00,
      pasta: 6.50,
      chips: 3.00,
      halloumi_fries: 5.50,
      calamari: 7.00,
      bruschetta: 3.50 }
    @order = []
  end

  def print_menu
    @dishes
  end

  def select(item)
    @order << item
  end

  def receipt
    total = 0
    copy = ""
    @order.each do |dish|
      copy += "#{dish} #{@dishes[dish.to_sym]} \n"
      total += @dishes[dish.to_sym]
    end
    copy + "Total #{total}"
  end

  def send_text
    arr = []
    time = Time.now
    time += 3600
    format_time = arr.push(time).join('').slice!(0, 19)
    a = "AC1bdf39b8064195f175d7b57f1db23404"
    b = "e67db5ae4fa141fb42daea58a4cc9311"
    client = Twilio::REST::Client.new(a, b)

    from = "+442891042502"
    to = "+447982904608"

    client.messages.create(
      from: from,
      to: to,
      body: "Your order has been places and will be with you by #{format_time}"
    )
    "Text sent"
  end
end
