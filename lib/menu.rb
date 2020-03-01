class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |title, price|
      # %s £%.2f is another way of doing string interpolation...
      # here we need to make sure the float for price is two
      # decimal places otherwise it will say 19.5 instead of 19.50...
      "%s £%.2f" % [title.to_s.gsub!(/_/, ' ').split.each{|i| i.capitalize!}.join(' '), price]
    end.join(", ")
  end
end
