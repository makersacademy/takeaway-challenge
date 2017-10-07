require "order"

describe Order do

subject(:order) {described_class.new("Tim")}

it 'has a name upon inititialisation' do
  expect(order.name).to eq "Tim"
  end

end
