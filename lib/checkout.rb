class Checkout

  def initialize(order, total_price)
    @order = order
    @total_price = total_price
  end

  def order_summery
    p "Your Order"
    p "Item     Quantity"
    @order.map{|k,v| p "#{k}     #{v}"}
    puts
    p "Order Total: £#{@total_price}"
    puts
    p "Type 'confirm' to place your order or 'reject' to change your order"
    #Your Order:
    # Item    Quantity
    # oreoes     3
    # Milkshake  1
    #Order Total:

    #Your Order:
    # Item    Quantity   Price  Total_Price
    # oreoes     3        3         9
    # Milkshake  1        2         2
    #Order Total                    11
  end
end

  # def confirmation
  #   p "Please 'confirm' or 'reject the order'"
  #   while (reply = gets.chomp)
  #     reply = gets.chomp
  #     if answer == 'confirm'
  #       confirm_order
  #       break
  #     end
  #     if answer == 'reject'
  #       query_order
  #       break
  #     end
  #     p "Please 'confirm' or 'reject' the order"
  #   end
  # end
  #
  # def confirm_order
  #   time = Time.now
  #   time + 1 hour
  #   text
  # end
