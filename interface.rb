require "./lib/menu"

class Interface
  attr_reader :menu, :starters, :mains, :desserts
  BUNNY_ASCII = '                          .".
                         /  |
                        /  /
                       / ,"
           .-------.--- /
          "._ __.-/ o. o\
             "   (    Y  )
                  )     /
                 /     (
                /       Y
            .-"         |
           /  _     \    \
          /    `. ". ) /" )
         Y       )( / /(,/
        ,|      /     )
       ( |     /     /
        " \_  (__   (__
            "-._,)--._,)'

  def initialize
    @menu = Menu.new("Ravenous Rabbit Raw Vegan Eatery")
    @starters = [Dish.new("Mexican Cauliflower Rice", 3, "Starter"),
      Dish.new("Sun-Dried Tomato Truffles", 4, "Starter"),
      Dish.new("Sunflower Seed Pate Nori Rolls", 3, "Starter")]
    @mains = [Dish.new("Raw Vegan Lasagna", 6, "Main course"),
      Dish.new("Falafel Buddha Bowls", 8, "Main course"),
      Dish.new("Kelp Noodles with Ginger Pesto", 7, "Main course")]
    @desserts = [Dish.new("Raw Caramel Apple Pie", 5, "Dessert"),
      Dish.new("Lime Matcha Cheesecake", 5, "Dessert"),
      Dish.new("Black Charcoal Smoothie Bowl", 7, "Dessert")]
  end

  def load
    starters.each { |dish| menu.add_dish(dish) }
    mains.each { |dish| menu.add_dish(dish) }
    desserts.each { |dish| menu.add_dish(dish) }
  end

  def process(input)
    menu.order(input)
  end

  def order
    loop do
      process(STDIN.gets.chomp)
      break if STDIN.gets.chomp == "finish"
    end
    order_confirm
  end

  def order_confirm
    puts "Your order:"
    menu.current_order.display
    puts "To submit your order, type your mobile phone number."
    puts "You will receive a confirmation by text."
    menu.current_order.submit(STDIN.gets.chomp)
    menu.current_order.text_confirmation.send
  end

  def user_welcome
    load
    puts "Welcome to the #{menu.name}!"
    puts BUNNY_ASCII
    puts "\n"
    print_menu
  end

  def print_menu
    menu.display
    puts "Please type the exact name of a dish you would like to order, then hit enter twice."
    puts "Type 'finish' when you're done."
    order
  end
end

interface = Interface.new
interface.user_welcome
