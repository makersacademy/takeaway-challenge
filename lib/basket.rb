class Basket
  attr_reader :contents

  def initialize
    @contents = []
  end

  def add(item)
    @contents << item
  end

  def remove(item)
    raise "Couldn't remove item: "\
          "it was not in the basket." unless @contents.include? item

    remove_one_item(item)
  end

  def total
    @contents.map { |item| item[:price] }.sum
  end

  private

  def remove_one_item(item)
    @contents.slice!(@contents.index(item))
  end
end
