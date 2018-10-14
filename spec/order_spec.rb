# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

require 'order'

describe Order do
  let(:order) { described_class.new(menu) }
  let(:menu) { double(:menu, price: 3) }
  let(:quantities) do
    { falafel: 2, houmous: 3 }
  end

  before do
    allow(menu).to receive(:contains?).with(:falafel).and_return(true)
    allow(menu).to receive(:contains?).with(:houmous).and_return(true)
  end

  it 'allows a user to select a quantity of dishes from a menu' do
    order.select(:falafel, 2)
    order.select(:houmous, 3)
    expect(order.basket).to eq quantities
  end

  describe '#select' do
    it 'adds a quantity of items to the basket' do
      order.select(:falafel, 5)
      expect(order.basket).to eq(falafel: 5)
    end

    it "doesn't add an item not on the menu" do
      allow(menu).to receive(:contains?).with(:chicken).and_return(false)
      expect { order.select(:chicken, 1) }.to raise_error("This item is not on the menu")
    end

  end

  describe '#remove' do
    it 'removes an item from the basket' do
      order.select(:falafel, 5)
      order.remove(:falafel)
      expect(order.basket).to eq({})
    end

    it 'wont remove an item that is not in the basket' do
      expect { order.remove(:falafel) }.to raise_error("Item not in basket")
    end
  end
  describe '#total' do
    it 'displays the basket total' do
      order.select(:falafel, 5)
      expect(order.total).to eq "£15"
    end
  end
end
