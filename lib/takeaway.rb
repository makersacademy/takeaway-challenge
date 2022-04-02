class Takeaway
  def initialize
    @menu = [
      { name: "Korma", price: 8.50 },
      { name: "Jalfrezi", price: 9.00 },
      { name: "Tikka Masala", price: 8.00 }
    ]
  end

  def list_menu
    @menu.map { |item| "#{item[:name]}: £#{item[:price]}0" }.join("\n")
  end
end
