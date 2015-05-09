class Order

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish dish
    @dishes << dish
  end

  def total
    @dishes.map(&:values).flatten.inject{ |sum, x| sum + x }
  end

  def show_order
    receipt = []
    @dishes.each do |h|
      h.each { |k, v| receipt << "#{k} @ #{v} x #{@dishes.map(&:keys).flatten.count(k)}" }
    end
    "#{receipt.uniq}; TOTAL: #{total}"
  end

end