class Order

  attr_reader :current

  def initialize
    @current = Hash.new(0)
  end

  def note_down(menu_options)
    loop do
      selection = note_selection
      break if selection.empty?
      raise "We don't have that here, try something else." if !menu_options.include?(selection.downcase)
      quantity = note_down_quantity
      @current[selection] = quantity
    end
  end

  def print_verification(menu_options)
    puts "You ordered:"
    print_quantity_strings(menu_options)
    puts total_cost_to_string(menu_options)
  end

  private

  def note_selection
    puts "What would you like to order? Press return when you are finished."
    selection = gets.chomp
    selection.gsub(/\s+/, "_").downcase.to_sym
  end

  def note_down_quantity
    puts "How many would you like?"
    quantity = gets.chomp.to_i
  end

  def print_quantity_strings(menu_options)
    @current.each do |item,quantity|
      cost = menu_options[item]
      puts "#{quantity} x #{item.to_s.gsub("_"," ")}(s) - £#{cost} each"
    end
  end

  def total_cost_to_string(menu_options)
    total_cost = calculate_total(menu_options)
    "Total cost: £#{total_cost}"
  end

  def calculate_total(menu_options)
    total_cost = 0
    @current.each do |item, quantity|
      total_cost += menu_options[item] * quantity
    end
    total_cost.floor(2)
  end

end
