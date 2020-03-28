require_relative 'order.rb'

class List
  
  attr_reader :menu
  
  def initialize
    @menu = { 
      'apple' => 3
     }
  end
  
  def method_missing(m, *args, &blk)
    if args.empty? && blk.nil? && @menu.has_key?(m.to_s)
      @menu
    elsif @menu.has_key?(m.to_s)
      [args[0], @menu]
    else
      'We do not have that on the menu'
    end
  end
end

