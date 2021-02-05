# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of 
# the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order 
# was placed and will be delivered before 18:52" after I have ordered


require 'menu'

describe Menu do

  describe '#dishes' do
    it 'returns a list of all available dishes and their prices' do
      expect(subject.dishes).to include({name: "Pizza", price: 10})
    end
  end

  describe '#order_dish' do
    it 'returns a single dish from the menu' do
      expect(subject.dish("Pizza")).to eq({name:"Pizza", price: 10})
    end

    it 'adds multiple dishes' do
      subject.dishes(2, "Pizza")
      expect(subject.order).to eq [{name:"Pizza", price: 10}, {name:"Pizza", price: 10}]
    end
  end
  
end