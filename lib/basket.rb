class Basket
  attr_reader :summary
  attr_accessor :items

  def initialize
    @items = []
  end

  def summary(items = unique_items)
    summary = []
    count = 0
    items.each do |item|
      @items.each { |dish| count += 1 if dish == item }
      summary.push("#{item.keys[0]} x#{count} = £#{item[item.keys[0]] * count}")
    end
    @summary = summary
  end

  def unique_items
    @items.uniq
  end

end
