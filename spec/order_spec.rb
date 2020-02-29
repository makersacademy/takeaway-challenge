require 'order'
require 'menu'

describe Order do

#   subject(:order) { described_class.new(menu) }
#   let(:menu) { instance_double("Menu") }

subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let (:items) do 
    { 
      chicken: 2, 
      fish:  1
    }
  end

  it "initializes with an empty order hash" do
    expect(subject).to have_attributes(items = {})
  end

  describe '#adds_item' do

    before do 
      allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    end

    it "adds an item to the order and sets number of items" do 
      expect(subject.adds_item(:chicken, 2)).to eq 2
    end

    it "raises an error if the food ordered is not on the menu" do
      allow(menu).to receive(:has_dish?).with(:beef).and_return(false) 
      expect{subject.adds_item(:beef, 1)}.to raise_error("That dish is not on the menu")
    end

  end

  describe '#total' do

    before do 
      allow(menu).to receive(:has_dish?).with(:duck).and_return(true)
      allow(menu).to receive(:price).with(:duck).and_return(10)
      allow(menu).to receive(:has_dish?).with(:waffles).and_return(true)
      allow(menu).to receive(:price).with(:waffles).and_return(8)
    end

    it "adds the total of multiples of one dish" do
      order.adds_item(:duck, 2)
      expect(subject.total_per_item).to eq [20]
    end

    it "adds the total price of the dishes" do
      order.adds_item(:duck, 2)
      order.adds_item(:waffles, 1)
      total = 28
      expect(subject.total).to eq 28
    end
  end
  
end
