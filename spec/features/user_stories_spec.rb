require 'takeaway'

# Takeaway Challenge User Stories

# 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
bobs_burritos = Takeaway.new
describe Takeaway do
  describe '#menu' do
    it 'shows the customer a menu' do
      expect { bobs_burritos.menu }.to output.to_stdout
    end
  end
end

# 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
bobs_burritos.order(1, 2)
bobs_burritos.order(3, 4)
describe Takeaway do
  describe '#basket' do
    it 'shows a log of items that have been ordered' do
      expect { bobs_burritos.basket }.to output("2 x  Beef Burrito - £20.00\n4 x  Veggie Burrito - £32.00\nTotal: £52.00\n").to_stdout
    end
  end
end

# 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
# This is fulfilled as the total displays with #basket

# 4
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
