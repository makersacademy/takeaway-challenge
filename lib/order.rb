class Order

  def initialize(takeawaymenu)
    @takeawaymenu = takeawaymenu
  end

  def order
    puts "Which item?"
    item_check(gets)
  end

  def basket

  end

  def checkout

  end

private

  def item_check(item)
    @takeawaymenu.has_key?(item.capitalize.chomp.to_sym)
  end

end
