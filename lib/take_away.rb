require_relative 'send_sms'

class TakeAway
  attr_reader :menu

  def initialize
    @menu = []
    @basket = []
    @total = 0
    import_file
  end

  def read_menu
    menu.each do |item|
      puts "#{item[:index]}. #{item[:item]}: £#{item[:amount]}"
    end
  end

  def order(item_number, quantity = 1)
    dish = menu[item_number - 1]
    @basket << { item_number: item_number, quantity: quantity }
    "You have added #{quantity} x #{dish[:item]} to your basket."
  end

  def basket_summary
    @basket.each do |order|
      dish = menu[order[:item_number] - 1]
      item_total = convert(dish[:amount], order[:quantity])
      @total += item_total.to_f

      puts "#{order[:quantity]} x #{dish[:item]} = £#{item_total}"
    end
  end

  def total
    puts "Total: £#{convert(@total)}"
    @total
  end

  def checkout(sum = 0)
    raise "Incorrect amount, please enter the total." if sum != total

    send_text
  end

  private

  def send_message
    phone = Message.new
    phone.send_text
  end

  def convert(price, quantity = 1)
    "%.2f" % (price.to_f * quantity.to_i)
  end

  def import_file
    file = File.open("./lib/menu.csv", "r")

    file.readlines.each_with_index do |line, index|
      item, amount = line.chomp.split(',')
      assign_values(index + 1, item, amount)
    end
    file.close
  end

  def assign_values(index, item, amount)
    @menu << { index: index, item: item, amount: amount }
  end
end
