
module Menu


  MENU = {'pizza' => 12.99, 'potato wedges' => 3.99, 'nachos' => 3.99, 'chicken wings' => 8.99, 'dip' => 0.49}


  def price(dish)
    MENU[dish]
  end

end