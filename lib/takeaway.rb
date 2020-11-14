class Takeaway
  attr_reader :list

  def initialize
    @list = list
  end

  def check()
      check.order
  end

  def display_dishes()
    @list = {
            :Tunasandwish => £ 3.00,
            :Chickensandwich => £ 3.50,
            :Vegsandwich => £ 3.00,
            :Hamsandwich => £ 4.00,
            :Prawnsandwich => £ 4.50
          }
  end
end
