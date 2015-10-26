class Invoice
  attr_reader :confirmed_order
  def initialize(final_order=[],twilio_klass)
    @final_order = final_order
    @names = []
    @confirmed_order = {}
    @twilio_klass = twilio_klass
    unique_dishes
  end

  def itemize_bill
    names.each {|name| confirmed_order[name] = {quantity: quantity(name), subtotal: subtotal(name)}}
    confirmed_order[:total] = total_order
    confirmed_order
  end


  def place_order(phone_num='123')
    @twilio_klass.new(phone_num,receipt,num_format(total_order))
  end

private
  attr_reader :names

  def unique_dishes
    @final_order.each {|dish| names << dish.name}
    names.uniq!
  end

  def quantity(dish_name)
    @final_order.count{|dish| dish.name == dish_name}
  end

  def subtotal(dish_name)
    quantity(dish_name) * @final_order.select {|dish| dish.name == dish_name}[0].price
  end

  def total_order
    bill = 0
    names.each {|name| bill += subtotal(name)}
    bill
  end

  def receipt
    list_of_dishes = ''
    names.each{|name| list_of_dishes += receipt_line(name) + "\n"}
    list_of_dishes
  end

  def receipt_line(dish_name)
    "#{quantity(dish_name)}x #{dish_name.to_s.gsub('_',' ')} - £#{num_format(subtotal(dish_name))}"
  end

  def num_format(num)
    '%.2f' % num
  end

end