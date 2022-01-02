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

# 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# 4
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered