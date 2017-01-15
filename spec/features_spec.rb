require 'twiliohelper'
require 'order'
require 'dish'
require 'menu'

describe "Feature tests" do
  let(:menu) { Menu.new }
  let(:dish_carbonara) { Dish.new("Linguine alla carbonara col tartufo",15) }
  let(:dish_lasagna) { Dish.new("Lasagne in bianco broccoli e salsiccia",12) }
  let(:order) { Order.new }

  before do
    @dishes_list = [dish_carbonara, dish_lasagna]
    menu.dishes += @dishes_list
  end
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customer can choose, show list of available dishes' do
    dishes_list_str = @dishes_list.each { |dish| "#{dish.name.ljust(20,'.')}#{dish.price.to_s.rjust(3,'.')}\n" }
    expect(menu.list_dishes).to eq(dishes_list_str)
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so customer can order, select dishes and store selection' do
    expect{order.dishes << {dish: menu.dishes[0], quantity: 2}}.not_to raise_error
    expect{order.dishes << {dish: menu.dishes[1], quantity: 1}}.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  # Place the order by giving the list of dishes, their quantities and a number that should be the exact total.
  it 'so customer can order, place the order by giving list of dishes, their quantities and a number that should be the exact total' do
    order.dishes += [
      {dish: menu.dishes[0], quantity: 2},
      {dish: menu.dishes[1], quantity: 1}
    ]
    restaurant = Restaurant.new
    restaurant.twiliohelper = TwilioHelper.new(send_sms_for_real: false)
    expect{restaurant.confirm(order.dishes,42)}.not_to raise_error
    expect{restaurant.confirm(order.dishes,30)}.to raise_error 'Cannot place order: total is wrong'
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it 'so customer receive order confirmation, send sms with confirmation text' do
    order.dishes << {dish: menu.dishes[0], quantity: 2}
    order.dishes << {dish: menu.dishes[1], quantity: 1}
    ##### TURN ON THE NEXT LINE IF NOT REALLY SENDING AN SMS, THE ONE AFTER IF SENDING IT FOR REAL
    restaurant = Restaurant.new
    restaurant.twiliohelper = TwilioHelper.new(send_sms_for_real: false)
    # restaurant.twiliohelper = TwilioHelper.new
    expect{restaurant.confirm(order.dishes,42)}.not_to raise_error
  end
end
