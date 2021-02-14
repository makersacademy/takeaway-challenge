class Menu

  attr_accessor :contents, :order

  def initialize
    @contents = [{ :pizza => 'margherita', :price => 7 },
                 { :pizza => 'mediterranean', :price => 8 },
                 { :pizza => 'pepperoni', :price => 9 },
                 { :pizza => 'four-cheese', :price => 10 },
                 { :pizza => 'meat-feast', :price => 11 }]
  end

  def view
    print_menu
  end

private
  def print_menu
    puts "PIZZA".ljust(20) + "PRICE"
    @contents.each { |item| puts "#{item[:pizza]}".ljust(20) + "£#{item[:price]}" }
  end

end
