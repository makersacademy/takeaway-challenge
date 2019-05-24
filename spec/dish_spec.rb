require 'dish'
describe Dish do
  subject(:dish) { described_class.new('Food', 299) }
  it 'should respond to price and name' do
  expect(dish).to respond_to :price 
  expect(dish).to respond_to :name 
  end
end