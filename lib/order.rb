class Order

  attr_reader :ordered_items, :total, :contact_number

  def initialize options
    @ordered_items = options[:items]
    @total = options[:total]
    @contact_number = options[:contact_number]
  end
end