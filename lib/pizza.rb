require_relative 'order_log'

class Pizza

  def initialize place_order = OrderLog.new
    @menu = {
              1 => [ "Good Pizza"   ,   8 ],
              2 => [ "Average Pizza",   6 ],
              3 => [ "Bad Pizza",       5 ],
              4 => [ "Cheap Wine"  ,    3 ],
              5 => [ "Cheaper Wine",    1 ]
            }
    @place_order = place_order
    # @log = place_order.log

  end

  def name
    "PIZZA PIZZA"
  end

  def list
    line_width = 22
    title = "MENU of #{self.name}"
    puts
    puts title.center(50)
    @menu.each do |key, value|
      beginning = "#{key}. #{value[0]}"
      ending    = "......... £#{value[1]}"
      puts beginning.ljust(line_width) + ending.rjust(line_width)
      puts
    end
  end

  def new_order
    @place_order.order @menu
  end

  def log
    @place_order.log
  end

  def clear_log
    @place_order.clear
  end

  def check_out
    @place_order.check_out
  end

end
