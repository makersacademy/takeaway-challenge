require 'order'
require 'menu'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu") }

  it "initializes with an empty order hash" do
    expect(subject).to have_attributes(order: {})
  end

  describe '#adds_item' do
  
    before do 
      allow(menu).to receive(:dish?).with(:chicken).and_return(true)
    end
  
    it "raises an error if the food ordered is not on the menu" do
      allow(menu).to receive(:dish?).with(:beef).and_return(false) 
      expect { subject.adds_item(:beef, 1) }.to raise_error("That dish is not on the menu")
    end

    it "gives you a successful addition message when you add an available item" do
      expect(subject.adds_item(:chicken, 2)).to eq("You have added 2 chicken to your order")
    end
  
  end

  describe '#total' do
  
    before do 
      allow(menu).to receive(:dish?).with(:duck).and_return(true)
      allow(menu).to receive(:price).with(:duck).and_return(10)
      allow(menu).to receive(:dish?).with(:waffles).and_return(true)
      allow(menu).to receive(:price).with(:waffles).and_return(8)
    end
  
    it "adds the total price of the dishes" do
      order.adds_item(:duck, 2)
      order.adds_item(:waffles, 1)
      expect(subject.total).to eq 28
    end
  end

end
