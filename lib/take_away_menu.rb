class TakeAwayMenu
attr_reader :items, :list_dishes

def items
  @items = @items = {'pasta' => 5, 'chips' => 2, 'salad' => 4, 'pizza' => 6, 'soup' => 5}
end

    def list_dishes
       puts "1. pasta: £5.00"
       puts "2. chips: £2.00"
       puts "3. salad: £4.00"
       puts "4. pizza: £6.00"
       puts "5. soup:  £5.00"
    end

end

# class Takeaway
#
#   def initialize(menu:)
#     @menu = menu
#   end
#
#
#   def print_menu
#     menu.print
#   end
#
#   private
#   attr_reader :menu
#
# end
