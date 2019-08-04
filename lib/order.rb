require_relative 'takeout'

class Order

  attr_accessor :time

  def initialize(menu)
    @takeout = Takeout.new(menu)
    @change = 0
    @time = nil
  end

  def view_menu
    @takeout.menu.each {|item, price| puts "#{item}:#{price.to_s.insert(2,".")}"}
  end

  def select(item, number)
    @takeout.order[item] = number
  end

  def placeorder(cash, mobile_number)
    if cash >= @takeout.price
      @change += (cash - @takeout.price)
      change_str = format_change(@change)
      puts "order placed"
      @time = Time.now
      @takeout.confirmorder(mobile_number, delivery_time_reformat, change_str)
    else
      raise 'not enough cash!'
    end
  end

  def format_change(pence)
    str = pence.to_s
     if str.length == 1
      str.insert(0, "00.0")
     elsif str.length == 2
      str.insert(0, "00.")
     elsif str.length >= 3
      str.insert(-3, ".")
     end
  end

  def delivery_time_reformat
    if @time.hour < 23
      @delivery_hour = @time.hour + 1
    else
      @delivery_hour = 00
    end
    @delivery_min_str = @time.min.to_s
    if @delivery_min_str.length == 1
      @delivery_min_str.insert(0, "0")
    end
    @delivery_hr_str = @delivery_hour.to_s
    if @delivery_hr_str.length == 1
      @delivery_hr_str.insert(0, "0")
    end
    return "#{@delivery_hr_str}:#{@delivery_min_str}"
  end

#Look up environment variables -- ENV[....number....]




end
