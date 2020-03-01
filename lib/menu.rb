class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |title, price|
      # %s £%.2f is another way of doing string interpolation...
      # here we need to make sure the float for price is two
      # decimal places otherwise it will say 15.5 instead of 15.50...
      # the gsub!(/_/, ' ').split.each{|i| i.capitalize!}.join(' ')
      # capitalizes the second letter of the word so spaghetti lobster is Spaghetti Lobster not Spaghetti lobster
      "%s £%.2f" % [title.to_s.gsub!(/_/, ' ').split.each{|i| i.capitalize!}.join(' '), price]
    end.join(", ")
  end

  def has_dish?(dish)
    !!dishes[dish]
  end

  def price(dish)
    dishes[dish]
  end
end
