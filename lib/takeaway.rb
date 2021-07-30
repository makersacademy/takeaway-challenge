class TakeAway
  def read_menu
    return { "Salted Caramel Shake" => 5.99, "Red Velvet Shake" => 5.99, "Cookie Dough Sandwich" => 4.99,
       "Choc-zilla Freak Shake" => 8.50, "Vanilla milkshake" => 3.99 }
  end
end

t = TakeAway.new
t.read_menu
