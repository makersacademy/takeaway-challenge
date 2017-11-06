class Menu

  LINEWIDTH = 20

  attr_reader :list

  def initialize
    @list = { pizza: 5, pasta: 12, fish: 8, burger: 7, chips: 3 }
  end

  def pretty_print
    arr = []
    @list.each do |item, price|
      arr << "#{item}".ljust(LINEWIDTH) + "#{to_currency(price)}\n".rjust(LINEWIDTH)
    end
    arr.join
  end

  def to_currency(number)
    "£#{sprintf('%.2f', number)}"
  end

end
