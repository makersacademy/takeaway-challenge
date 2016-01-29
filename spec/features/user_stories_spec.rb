require_relative '../../lib/takeaway.rb'

describe "FEATURE SPEC" do



# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  describe 'takeaway features' do
    it 'US1 - see a list of dishes with prices' do
      takeaway = Takeaway.new(Menu.new)
      expect(takeaway.show_menu).to eq ({ ribs: 3,
      beef: 4,
      rolls: 3,
      chips: 2,
      pies: 5})
    end


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
    it 'US2 - selects some dishes' do
      takeaway = Takeaway.new(Menu.new)
      #pass in the order
      expect(takeaway.select({beef: 2, rolls: 3}, 17)).to eq ({beef: 2, rolls: 3})
    end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
    it 'US3 - raises error when billed different amount' do
      takeaway = Takeaway.new(Menu.new)
      takeaway.select({beef: 2, rolls: 3}, 23) 
      expect {takeaway.correct_bill?}.to raise_error("incorrect bill amount")
      end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    it 'US4 - returns confirmation if bill matches estimate' do
      takeaway = Takeaway.new(Menu.new)
      takeaway.select({beef: 2, rolls: 3}, 17) 
      expect(takeaway.correct_bill?).to eq "Thank you! Your order was placed and will be delivered before #{takeaway.delivery_time}"
      end  
  end
end