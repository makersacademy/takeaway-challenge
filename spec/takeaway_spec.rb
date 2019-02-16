require 'takeaway'

describe Takeaway do

subject(:takeaway) { described_class.new }
it 'shows a list of dishes and prices' do
  expect(takeaway.menu).to eq("Dish 1")
end


end
