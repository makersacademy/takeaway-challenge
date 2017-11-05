class Menu

  LINEWIDTH = 50

  attr_reader :list

  def initialize
    @list = { pizza: 5, pasta: 12, fish: 8, burger: 7, chips: 3 }
  end

  def pretty_print
    arr = []
    @list.each do |item, price|
      arr << "#{item}".ljust(LINEWIDTH / 2) + "#{price}\n".rjust(LINEWIDTH / 2)
    end
    arr.join
  end

end
