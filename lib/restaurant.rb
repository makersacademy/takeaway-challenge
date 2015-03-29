require 'twilio-ruby'

class Restaurant
  attr_reader :menu, :order_recived

  def initialize menu
    @menu = menu.new
    @order_recived = []
  end

  def get order, total, telephone
    @order_recived << order
    send_message total, telephone
  end

  def send_message total, telephone
    time = Time.now
    hour = (time.strftime('%I')).to_i
    min = (time.strftime('%M')).to_i
    meridian = time.strftime('%p')
    account_sid = 'AC9b042d9d06fec81d3d8044e7cb2975e2'
    auth_token = '648dfb68388439402d7316fd4959ec6b'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: '+441315104481',
      to: "#{telephone}",
      body: "\nOrder recived!\nThe total is £ #{total}.\nIt will arrive before #{hour + 1}:#{min} #{meridian}."
    )
  end
end
