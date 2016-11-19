class Order

attr_reader :selected_dishes

  def initialize
    @selected_dishes = []
  end

  def total_cost
    raise "No dishes selected." if selected_dishes == []
    total = []
    selected_dishes.each {|subhash| subhash.each {|dish, value| total << value}}
    "£#{total.inject(:+)}"
  end

  def view_order
    result = Hash.new(0)
    selected_dishes.each do |subhash|
      subhash.each {|dish, value| result[dish] += value}
    end
    result
  end


end
