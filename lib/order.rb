#manages the order

class Order

attr_reader :selected_dishes

  def initialize
    @selected_dishes = []
  end

  def total_cost
    check_for_error
    total_cost_as_string
  end

  def view_order
    check_for_error
    dishes_with_total
  end

private

  def check_for_error
    raise "No dishes selected." if selected_dishes == []
  end

  def dishes_with_total
    result = Hash.new(0)
    selected_dishes.each {|hash| result[hash] += 1}
    result["Total cost:"] = total_cost
    result
  end

  def total_cost_as_string
    total = []
    selected_dishes.each {|subhash| subhash.each {|dish, value| total << value}}
    "£#{total.inject(:+)}"
  end

  def selected_dishes
    @selected_dishes
  end



end
