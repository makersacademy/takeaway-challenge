
class Takeaway

  attr_accessor :list, :order, :amount_due

  def initialize
    @list = {'red curry' => 5, 'green curry' => 5}
    @order = []
    @amount_due = 0
  end

  def register_order (item)
    order << item
  end

  def empty?
    # order.empty?
    list.empty?
  end

  def confirm_order
    amount_due = takeaway.order.map{|x| x.values}.flatten(1).inject(:+)
    "your oder was placed total amount due is #{amount_due}$"
  end
end







