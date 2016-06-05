class Orderer

  attr_reader :list, :ordered

  def initialize(list, messenger)
    @list = list.freeze
    @ordered = Hash.new(0)
    @messenger = messenger
  end
  
  def order(obj_id, quantity)
    ordered[list[obj_id]] += quantity
  end

  def show_all
    result = first_line
    result << list.each_with_index.inject(""){ |sum, (obj, i)| sum  << "#{ i }: #{ obj }\n" }
    result << end_line
  end

  def show_order
    result = first_line
    result << ordered.inject(""){ |sum, (obj, quantity)| sum + obj.subtotal_line(quantity) + "\n" }
    result << total_line
  end
  
  def order_total
    ordered.inject(0){ |sum, (obj, quantity)| sum + obj.subtotal(quantity) }
  end

  def confirm
    @messenger.send(show_order)
  end
  
  private
  
  def total_line
    "\nTotal: #{ order_total }\n" + end_line
  end

  def first_line
    "\n---------------------\n"
  end

  def end_line
    "\n---------------------\n"
  end
end
