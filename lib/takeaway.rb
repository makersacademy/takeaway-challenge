class Takeaway
  def view_menu
    { Burger: :£4, Fish: :£4, Sausage: :£4, Chips: :£1 }
  end

  def order
    puts "What would you like to order?"
    item = gets.chomp
  end
end
