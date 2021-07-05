# workings to try and work out how to create a method
# to see if the menu array contains a selected dish
menu = [{ korma: 5 }, { madras: 10}]

dish = "korma"

  menu.each do |entry|
    entry.each do |dish, price|
      dish = "korma"
      p entry.has_key?(dish.to_sym)
    end
  end
