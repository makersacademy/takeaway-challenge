require_relative 'send_sms'
class Menu
  attr_reader :menulist, :total, :dishes

  def initialize(total = 0)
    @dishes = []
    @total = total
    @menulist = { "Chinese" => 8,
      "Indian" => 9,
      "Italian" => 10,
      "Kebab" => 5,
      "Sandwich" => 3,
      "Condensed Air" => 1
    }

  end

  def choice
    puts "Menu choice:"
    @menulist.each do |dish, price| puts "#{dish} - £#{price} "
    end
  end

  def order(dish, quantity)
    puts "-----"
    @dishes.push(dish)
    @dishes.push("quantity: #{quantity}")
    @quantity = quantity
    v = @menulist.select { |key, _value| dish.include? key }.values
    v = v.join.to_i
    @dishes.push("Value of each dish: #{v}")
    total = v * quantity
    @total += total
  end

  def bill
    puts "+++++"
     puts "#{@dishes} total: #{@total}"
  end

  def text
    Sms.new

  end

end
