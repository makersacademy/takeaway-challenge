#manages the order

class Order

attr_reader :selected_dishes

  def initialize
    @selected_dishes = []
  end

  def total_cost
    check_for_error
    total = []
    selected_dishes.each {|subhash| subhash.each {|dish, value| total << value}}
    "£#{total.inject(:+)}"
  end

  def view_order
    result = Hash.new(0)
    selected_dishes.each {|hash| result[hash] += 1}
    result
  end

  def confirm_order
    check_for_error
    result = Hash.new(0)
    selected_dishes.each do |subhash|
      subhash.each {|dish, value| result[dish] += 1}
    end
    result["Total cost"] = total_cost
    result
  end

private

  def check_for_error
    raise "No dishes selected." if selected_dishes == []
  end

end
