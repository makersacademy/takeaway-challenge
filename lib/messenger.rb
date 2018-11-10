class Messenger
  def initialize(client, order, credentials)
    @client = client
    @order = order
    @credentials = credentials
  end

  def message
    { from: @credentials[:from], to: @credentials[:to],
      body: "Hi there, your order totalling £#{format_price(@order.total)} " +
              "will be with you at #{delivery_time}" }
  end

  def send
    @client.messages.create(message)
  end

  private
  def delivery_time
    "#{Time.new.hour + 1}:#{Time.new.min}"
  end

  def format_price(pence)
    pence_array = arrayify_pence(pence)
    if less_than_pound?(pence)
      2.times { pence_array.unshift("0") }
      add_decimal_point(pence_array)
    else
      add_decimal_point(pence_array)
    end
  end

  def add_decimal_point(pence_array)
    pence_array.insert(-3, '.').join
  end

  def arrayify_pence(pence)
    pence.to_s.chars
  end

  def less_than_pound?(pence)
    pence.to_s.size <= 2
  end

end
