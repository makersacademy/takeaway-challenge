require_relative 'order.rb'

class List
  
  attr_reader :menu, :order
  
  def initialize
    @menu = {
      'apple' => 3,
      'ham' => 4
     }
     @order =[]
  end
  
  def method_missing(m, *args, &blk)
    if args.empty? && blk.nil? && @menu.has_key?(m.to_s)
      choice = Hash.new
      choice[m] = @menu[m.to_s]
      @order << choice
      puts @order
#    elsif @menu.has_key?(m.to_s)
#      [args[0], @menu]
    else
      'We do not have that on the menu'
    end
  end
end

