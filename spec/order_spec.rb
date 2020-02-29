require 'order'
require 'menu'

describe Order do

#   subject(:order) { described_class.new(menu) }
#   let(:menu) { instance_double("Menu") }

subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

#   let (:items) do 
#     { 
#       chicken: 2, 
#       fish:  1
#     }
#   end

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

  
end
