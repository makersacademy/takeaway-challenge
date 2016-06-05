class OrderParser

  def  self.parse(order)
    parsed_order = []
    order = order.split(',')
    order.each { |dish| parsed_order << dish.strip.split('-',2)}
    input_order_check(parsed_order)
    parsed_order
  end

  def self.input_instructions
    puts "Please type your desired order."
    puts " type the number of dishes followed by '-' and the dish name"
    puts " separate the orders with a comma, if you wish to order more than one kind of dish"
    puts " ex: 2-Pizza,3-Pasta,1-Wrap"
  end

  private

  def self.input_order_check(parsed_order)
    fail ArgumentError, \
    "Invalid input: please type a number followed by '-' and a dish name" \
    if parsed_order[0].length < 2

    fail ArgumentError, \
    "Invalid input: please type the number of portions for each dish" \
    if !parsed_order.all?{ |single_order| /\A\d+\z/.match(single_order[0])}

  end
end
