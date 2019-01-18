require 'order'

describe Order do
  subject(:example_order) { described_class.new(restaurant_menu) }
  let(:restaurant_menu) { double :menu, dishes: dishes}
  let(:dishes) do
      {
        :chicken => 2.99,
        :beef => 3.49,
      }
  end

  describe '#new' do
    it "Initializes with an empty hash and argument menu" do
      expect(example_order.ordered).to be_empty
    end
    it "Initializes with an empty hash and argument menu" do
      expect(example_order.menu).to eq restaurant_menu
    end
  end

  describe '#add'
    it "Adds an item on the menu to order hash" do
      example_order.add("chicken", 1)
      expect(example_order.ordered).to include({:dish => "chicken", :quantity => 1})
    end
      it "Throws an error if item doesn't exist on menu" do      message = "vegan is not on the menu!"
      expect { example_order.add("vegan", 1) }.to raise_error(message)
  end

  # describe '#total'
  # it 'Adds all values in ordered array' do
  #   example_order.add("chicken", 5)
  #   expect(example_order.total).to eq 14.95
  # end
end
