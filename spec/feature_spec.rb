require './lib/restaurant'

# describe "Stuff is working" do
#   it do
    menu = [
      { name: "spaghetti", price: 7, quantity: 8 }.freeze,
      { name: "meatball", price: 6, quantity: 9 }.freeze,
      { name: "pizza", price: 9, quantity: 10 }.freeze
    ].freeze
    restaurant = Restaurant.new(menu)
    p available_dishes = restaurant.available_dishes
    order = Order.new(available_dishes)
    #
    # expect(restaurant.available_dishes.length).to eq(3)

    puts
    p restaurant.create_order
    p order.add('spaghetti', 8)
    p order.add('pizza', 2)
    p order.add('meatball', 6)
    puts
    p order.basket

    puts
    
    puts
    p order.sum_items

    # p c.merge(b) { |k, v1, v2| k[:quantity] = v1 - v2 }


    # p c.merge(b){|k, v1, v2| quantity:(v1 - v2)}
    # p
#   end
# end
