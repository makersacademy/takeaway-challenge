class Menu

  attr_reader :items

  def display
    n = 0
    @items.each { |item, price| puts "#{n += 1}.#{item} : £#{'%.2f' % price}" }
  end

  def add_to_order(item, number)
    @list.add_list(item, number, items)
  end

  def see_list
    @list.dishes
  end

  def total
    sum = 0
    @list.dishes.each do |choice|
      sum += @items[choice]
    end
    sum
  end

  private

  def initialize(list = List.new)
    @items = {
       pappadom_preach: 0.50, tikka_to_ride: 4.75, livin_dhal: 3.25,
       jalfrezi_rock: 5.50, saag_ado: 3.00, paperback_raita: 0.75,
       korma_police: 4.50, dhansak_queen: 5.00, bhaji_trousers: 2.75,
       rice_rice_baby: 2.50
    }
    @list = list
  end

end
