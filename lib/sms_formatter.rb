class SmsFormatter

  def format_menu(dishes)
    string = "Menu:\n"
    dishes.each do |dish|
      string += dish.name + ", " + dish.price.to_s + "\n"
    end
    string
  end

  def parse_order(sms)
    dishes = []
    lines = sms.split("\n")

    lines[0, lines.length - 1].each do |line|
      name, quantity = line.split(", ")
      dishes << { name: name, quantity: quantity.to_i }
    end

    _, total_price = lines[-1].split(": ")
    [dishes, total_price.to_i]
  end
end
