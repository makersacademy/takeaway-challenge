# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'takeout'

context 'menu' do
  describe Takeout do
    it 'Shows list of dishes with prices' do
      expect(subject.list).to eq({'A' => 15, "B" => 10})
    end
  end
end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
context 'select items' do
  describe Takeout do
    it 'adds items and number to array' do
      subject.select("A", 2)
      subject.select("B", 1)
      expect(subject.order).to eq({"A" => 2, "B" => 1})
    end
  end
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#context 'select items' do
context 'pricer' do
  describe Takeout do
    it 'adds items and number to array' do
      subject.select("A", 2)
      subject.select("B", 1)
      expect(subject.price).to eq(40)
    end
  end
end
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
context 'pricer' do
  describe Takeout do
    it 'adds items and number to array' do
      subject.select("A", 2)
      subject.select("B", 1)
      expect(subject.price).to eq(40)
    end
  end
end
