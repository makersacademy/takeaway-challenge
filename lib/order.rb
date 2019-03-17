class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(item)
    basket << item
  end

  def remove(item)
    raise "Couldn't remove item: "\
          "it was not in the basket." unless basket.include? item

    remove_one_item(item)
  end

  def total
    basket.map { |item| item[:price] }.sum
  end

  def confirm(users_total)
    users_total == total
  end

  private

  def remove_one_item(item)
    basket.slice!(basket.index(item))
  end
end
