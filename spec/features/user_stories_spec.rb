require 'menu'
describe 'User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it "can see a list of dishes with prices" do
    menu = Menu.new
    expect(menu.see_dishes).to eq({spring_rolls: 3.99 , crispy_duck: 11.95, chop_suey: 10.95, fried_rice: 4.99})
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it "can select a dish and quantity" do
    menu = Menu.new
    expect(menu.order('spring rolls', 2)).to eq('added to basket: spring rolls x2')
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
