require './lib/menu.rb'

class Order
  attr_reader :choice
  def initialize(menu = Menu)
    @menu = menu.new
    @choice = []
  end

  def see_menu
    @menu.list
  end

  def choose_item(name, count = 1)
    puts "#{count}x #{name}(s) added to your basket"
    count.times { @choice << {name => @menu.get_price(name)} }
  end

  def order_summary
    self.work_out_order
  end

  def total_price
    t = 0
    @choice.each do |i|
      i.each_value { |v| t += v }
    end
    t
  end

  def print_receipt
    # @choice.each do |i|
    #   i.each {|k, v| puts "#{k} - £%0.2f" % v }
    # end
    self.work_out_order
    puts "Total to pay: £%0.2f" % self.total_price
  end

  def work_out_order
    number = {}
    count = 1
    @choice.each do |h|
      h.each_key do |k|
        if !number.has_key?(k)
          number[k] = count
        else
          number[k] +=1
        end
      end
    end
    number.each {|k, c| puts "#{k} x#{c} = £%0.2f" % (@menu.get_price(k) * c) }
  end

end
