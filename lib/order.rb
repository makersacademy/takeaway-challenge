require_relative 'menu'
require_relative 'text_message'
require_relative 'print_outs'

class Order
  attr_reader :menu, :order, :total, :print_out

  def initialize
    @menu = Menu.new
    @order = []
    @total = 0
    @print_out = PrintOut.new
  end

  def add(item, num)
    order << { item: item, num: num }
    @total += menu.items[item] * num
  end
  
  def checkout(phone_number, text_message = TextMessage.new)
    content = print_out.message_content(total)
    text_message.send(phone_number, content)
  end

  def show
    print_out.receipt_header
    receipt_middle
    receipt_footer
  end

  def receipt_middle
    order.each do |item|
      print "#{item[:num]} x #{item[:item]}"
      print "#{' ' * space_calculator(item)}"
      print "£#{'%.2f' % menu.items[(item[:item])]}\n"
    end
  end

  def receipt_footer
    print "------------------------------------\n"
    print "Total:#{' ' * (29 - ('%.2f' % total).to_s.length)}"
    print "£#{'%.2f' % total}\n\n"
  end

  private

  def space_calculator(item)
    32 - quantity_length(item) - item_length(item) - cost_length(item)
  end

  def quantity_length(item)
    item[:num].to_s.length
  end

  def item_length(item)
    item[:item].length
  end

  def cost_length(item)
    ('%.2f' % menu.items[(item[:item])]).to_s.length
  end
end
