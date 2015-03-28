class Restaurant
  attr_reader :menu, :order_recived

  def initialize menu
    @menu = menu.new
    @order_recived = []
  end

  def get order, telephone
    @order_recived << order
    t = Time.now
    send_message telephone
  end

  def send_message telephone
    account_sid = 'AC9b042d9d06fec81d3d8044e7cb2975e2'
    auth_token = '648dfb68388439402d7316fd4959ec6b'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: '+441315104481',
      to: "#{telephone}",
      body: "\nOrder recived!\nIt will arrive before #{t.hour + 1}:#{t.min}"
    )
  end
end
