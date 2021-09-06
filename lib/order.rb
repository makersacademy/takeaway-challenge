class Order

  attr_reader :selected_items, :total_price

  def initialize
    @selected_items = []
    @total_price = 0
    @successful = false
  end 

  def add_selected_item(name)
    @selected_items << (name)
    calculate_price
  end 

  def confirm_order?
    @successful
  end 

  def confirm_order
    @successful = true
  end

  def display_items
    @selected_items.each do |pizza|
      puts "Pizza: #{pizza[:name]} Price: #{pizza[:price]}"
    end 
  end 

  private

  def calculate_price
    @total_price = 0
    @selected_items.each do |pizza|
    @total_price += pizza[:price]
    end 

    puts "Your total price is: £#{@total_price}"
  end 
  
end 
