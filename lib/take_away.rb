class TakeAway

  attr_reader :menu

  def initialize(menu_klass,order_klass)
    @menu = menu_klass.new
    @order = order
  end

  def order(*args, total)
    total_value = 0
    string = ""
    args.each_slice(2) do |name,number|
      menu.each do |dish|
         if dish.include?(name.to_sym)
           total_value += dish[name.to_sym] * number
           string << "#{number} dish(es) of #{name} "
         end
      end
    end
    total_value
    raise "Incorrect total value." if total != total_value
    "You ordered " + string
  end

  private



end
