class FormatOrder

  attr_reader :lines

  def initialize(items, total)
    @lines = ["\n"]
    @total = "%.2f" % total
    @max_len = items.keys.map { |x| x.name }.max_by(&:length).length
    @divider = "-" * (@max_len + 12)
    format(items.sort_by { |key, _| key.id })
  end

  private
  
  def format(items)
    category_format("Order")

    items.each do |item, quantity|
      item_format(quantity, item.name, item.price)
    end

    total_format()
  end
  
  def category_format(category)
    @lines += [@divider, category, @divider]
  end

  def item_format(quantity, name, price)
    @lines += ["#{quantity.to_s.rjust(2)}x #{name.ljust(@max_len)} £ #{price.rjust(5)}"]
  end

  def total_format
    @lines += [@divider, "Total" + " " * @max_len + "£ #{@total.to_s.rjust(5)}", @divider]
  end

end
