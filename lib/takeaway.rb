require './lib/menu'

class Takeaway
  
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
    @menu = Menu.new
    @dishes = []
  end

  def menu
    @menu
  end

  def show_menu
    @menu.show
  end

  def order
    loop do
      @output.puts "Please type each dish you require followed by return. When you have finished your order press return twice."
      dish = @input.gets.chomp
      # return true if dish == "" 
      if menu.check(dish)
        @output.puts "how many do you want?"
        quantity = @input.gets.to_i
        return true
      else
        @output.puts "Sorry, we don't have that dish - perhaps you've made a spelling mistake?"
      end
    end
  end
  
end


# need to get the method order looping to keep asking until double return
# line 24 and removing line 28 does this for an irb test but it breaks 
# the rspec tests. Until this is fixed we can't run the 3 items test
# also the order is not being put anywhere yet - needs to be added to a 
# hash - and perhaps to and order class