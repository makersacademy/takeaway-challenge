class Basket

  attr_reader :contents

  def initialize
    @contents = []
  end

  def add_item(item)
    @contents << item
  end

  def review_contents
    format_contents.join("\n")
  end

  def empty?
    @contents.count.zero?
  end

  private

  def format_contents
    @contents.map { |h| count_and_format(h) }.uniq << contents_total
  end

  def count_and_format(item)
    item_count = @contents.count(item)
    "x#{item_count} #{item.name}: £#{(item_count.to_f * item.price).round(2)}"
  end

  def contents_total
    contents_prices = @contents.map { |h| h.price }
    "TOTAL: £#{contents_prices.sum.round(2)}"
  end

end
