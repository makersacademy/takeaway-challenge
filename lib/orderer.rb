class Orderer

  attr_reader :list, :ordered

  def initialize(list = [], messenger)
    @list = list.freeze
    @ordered = Hash.new(0)
    @messenger = messenger
  end
  
  def order(obj_id, quantity)
    ordered[list[obj_id]] += quantity
  end

  def show_all
    list.each_with_index.inject(""){ |sum, (obj, i)| sum  << "#{ i }: #{ obj }\n" }
  end

  def show_order
    ordered.inject(""){ |sum, (obj, quantity)| sum + obj.subtotal_line(quantity) } + total_line
  end
  
  def order_total
    ordered.inject(0){ |sum, (obj, quantity)| sum + obj.subtotal(quantity) }
  end

  def confirm
    @messenger.send(show_order)
  end
  
  private
  
  def order_line(obj, quantity)
    obj.subtotal_line
  end

  def total_line
    "\nTotal: #{ order_total }"
  end
end
