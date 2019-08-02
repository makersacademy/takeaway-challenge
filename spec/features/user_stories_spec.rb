require './lib/takeaway.rb'
describe Takeaway do
let(:takeaway) { described_class.new }
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
it 'Should have a list of prices' do
  expect(takeaway.menu).to eq ({:pepperoni => 10, :hawaiian => 12, :meat_feast => 15})
end

end
