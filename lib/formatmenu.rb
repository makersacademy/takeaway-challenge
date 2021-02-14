class FormatMenu

  attr_reader :lines

  def initialize(items)
    @lines = []
    @category = nil
    @max_len = items.values.map { |x| x.name }.max_by(&:length).length
    @divider = "-" * (@max_len + 12)
    format(items.sort_by { |key, _| key })
  end

  private
  
  def format(items)

    items.each do |id, item|
      category_format(item.category) if item.category != @category  
      item_format(id, item.name, item.price)
    end

  end

  def category_format(category)
    @lines += [@divider, category, @divider]
    @category = category
  end

  def item_format(id, name, price)
    @lines += ["#{id.to_s.rjust(2)}. #{name.ljust(@max_len)} £ #{price.rjust(5)}"]
  end

end
