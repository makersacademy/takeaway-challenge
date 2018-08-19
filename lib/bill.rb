require './lib/dishes'

class Bill
  include Dishes

  def create(current_order)

    puts "DISH || QUANTITY || PRICE"
    
    current_order.each do |line|
      formatted_line = line.join(" || ")
      print "#{formatted_line}\n"
    end

    print "TOTAL = £#{total(current_order)}\n"
  end

  private

  def total(current_order)
    total = 0
    
    current_order.each do |line|
      total += (line[1].to_i * line[2].to_i)
    end

    total
  end

end
