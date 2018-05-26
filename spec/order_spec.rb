require 'order'
require 'menu'

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe Order do
  let(:order) { Order.new }

  it 'responds to add_item' do
    expect(subject).to respond_to(:add_item).with(2).arguments
  end

  it 'adds the selection to the basket' do
    order.add_item(:sushi, 1)
    expect(subject.add_item("sushi")).to eq subject.basket
  end

end
