class Takeaway

  def initialize
    @menu
    @dishes
  end


  def read_menu
  end

  def order(item, amount)
  end

  def is_correct_amount?(price)
    total_price == price
  end


  def basket_summary
  end

  def complete_order
    is_correct_amount?(price)
    send_text("Swell. Thank you for your order. The total price: #{total_price}")
  end
  

  def send_text(message)
    Twilio::REST::Client.new(ENV['ACbdceab5ffb3a83df647d818777df3c91'], ENV['83e3752f9614e4a7ee27122213d23401'])
      .messages.create(
        from: ENV[+441290366057],
        to: ENV[+447460161991],
        body: message
      )
  end



end




end
