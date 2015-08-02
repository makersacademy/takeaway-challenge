class Order

  attr_reader :ordered_items, :total

  def initialize options
    @ordered_items = options[:items]
    @total = options[:total]
  end
end