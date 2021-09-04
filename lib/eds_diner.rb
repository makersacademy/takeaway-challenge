class EdsDiner

  def initialize 
    @dishes = { 1=> { :name => "Tomato Soup", :price => 5 }, 2 =>{ :name => "Avocado On Toast", :price => 7 }, 3 => { :name => "Spaghetti Bolognese", :price => 12 }, 4 => { :name => "Mushroom Surprise", :price => 9 }, 5 => { :name => "Pizza", :price => 10 }, 6 => { :name => "Ice Cream", :price => 4}, 7=>{ :name => "Cake", :price => 4 }} 
  end

  attr_reader :dishes

  def show_menu 
    title("EdsDiner Menu:")
    @dishes.each do |number, dish| 
      puts "#{number}. #{dish[:name]}  £#{dish[:price]}"
    end
  end

  def select_dishes
    show_menu
    title("Select item by number (e.g. 1) or 'quit'")
    # while true do
      
    # end
  end


  private

  def title(text)
    puts " "
    puts text
    ((text.length) - 1).times { print "~" }
    puts "~"
  end
end
