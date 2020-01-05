class Order

  attr_reader :items
  attr_reader :status

  def initialize
    @items = []
    @status = "empty"
  end

  def add(items)
    raise "order already submitted" if @status == "submitted"
    @status = "awaiting submission"
    items.each do |item|
      @items << item
    end
  end

  def total
    sum = 0
    @items.each do |item|
      sum = sum + item[1]
    end
    sum
  end

  def submit
    raise "order already submitted" if @status == "submitted"
    @status = "submitted"
  end

end