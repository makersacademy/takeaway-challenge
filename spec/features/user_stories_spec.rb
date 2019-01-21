
require 'menu'
describe 'Takeaway Challenge' do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

dishes =
"1 Chicpeas Jungle       £12,95
2 Brocoli Bush          £9,95
3 Aspargus Forest       £11,95
4 Lentils Peak          £8,95
5 Banana Curnicopia     £6,95
"

  it 'customer can see a list of dishes with prices' do
    menu = Menu.new
    expect { menu.display }.to output(dishes).to_stdout
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'customer can select some number of several available dishes' do
    menu = Menu.new
    dish = "Banana Curnicopia"
    message = "1 #{dish} has been added to your order"
    expect { menu.order(dish: dish)}.to output(message).to_stdout

  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
