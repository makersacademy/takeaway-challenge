require 'takeaway.rb'
require 'menu.rb'

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
#
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
# ```

describe Takeaway do

  subject(:takeaway) { Takeaway.new }
  subject(:menu) { Menu.new }

  context '#show_menu' do
    it 'displays dishes and prices' do
      expect(takeaway.show_menu).to eq(menu.display_menu)
    end
  end


end
