def symbol_to_string(symbol)
  symbol.to_s.gsub('_', ' ')
end

def string_to_symbol(string)
  string.downcase.gsub(' ', '_').to_sym
end

# => methods for menu:

def curry
  {chicken: 5.95, king_prawn: 8.75, lamb: 5.95, prawn: 6.95, vegetable: 5.55}
end

def curry_menu
  [
    Dish.new('Korma', curry), Dish.new('Bhuna', curry), Dish.new('Madras', curry),
    Dish.new('Masala', curry)
  ]
end
