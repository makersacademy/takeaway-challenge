
describe "user stories" do

  # PERSONAS
  # Kylie and Marc, ordering a take out meal

  let(:menu) { Menu.new }
  let(:order) { Order.new }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so that Marc can see if wants to order something,
      he should be able to see a list of dishes with prices' do
    expect{ menu.view }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so that Kylie can order what she wants,
      she should be able to select from available dishes' do
    dish = "Beef"
    expect{ menu.select(dish, 2) }.not_to raise_error
  end

  # # - As a customer
  # # - So that I can verify that my order is correct
  # # - I would like to check that the total I have been given
  # #   matches the sum of the various dishes in my order
  it 'so that Marc can verify the order is correct,
      he should be able to check that total price matches
      the sum of various dishes' do
    dish = "Chicken"
    menu.select(dish, 1)
    expect{ menu.order.review }.not_to raise_error
  end

  # # - As a customer
  # # - So that I am reassured that my order will be delivered on time
  # # - I would like to receive a text such as "Thank you!
  # #   Your order was placed and will be delivered before 18:52" after I have ordered
  it 'so that Kylie is reassured the order will be delivered
    on time, she should receive a confirmation text message
    after order' do
    dish = "Chicken"
    menu.select(dish, 1)
    expect{ menu.order.place(false) }.not_to raise_error
  end
end
