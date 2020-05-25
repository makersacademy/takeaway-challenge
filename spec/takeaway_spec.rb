require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do

  let(:order) { Order.new }
  let(:printed_menu) { {

    'Salmon Poke Bowl' => 8,
    'Tuna Poke Bowl' => 8,
    'Tofu Poke Bowl' => 8,
    'Chicken Poke Bowl' => 8,

    'Blue Hawaii Cocktail' => 7,
    'Mai Tai Cocktail' => 7,
    'Hawaiian Margarita Cocktail' => 7,
    'Mango Martini Cocktail' => 7

    }
  }

  it 'creates a new instance of takeaway' do
    expect(subject).to be_instance_of Takeaway
  end

  describe '#view_menu' do

    it 'prints the menu' do
      expect(subject.view_menu).to eq(printed_menu)
    end
  end

  describe '#add_item' do

    it 'allows user to add items to the basket' do
      expect(subject.add_item("item", 2)).to eq(order.add_to_order("item", 2))
    end
  end
end
