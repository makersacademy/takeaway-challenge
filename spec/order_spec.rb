# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

require 'order'

describe Order do
  let(:order) { described_class.new(menu: menu) }
  let(:menu) { double(menu: :each) }
  let(:quantities) do
    { falafel: 2, houmous: 3 }
  end

  it 'allows a user to select a quantity of dishes from a menu' do
    order.select(:falafel, 2)
    order.select(:houmous, 3)
    expect(order.items).to eq quantities

  end
end
