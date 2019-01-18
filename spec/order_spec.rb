require 'order'

describe Order do
  subject(:example_order) { described_class.new(restaurant_menu) }
  let(:restaurant_menu) { double :menu, dishes: dishes}
  let(:dishes) do
      {
        chicken: 2.99,
        beef: 3.49,
      }
  end

  # subject(:takeaway) { described_class.new(restaurant_menu) }
  # let(:restaurant_menu) { double :menu, dishes: dishes, print_menu: formatted_menu }
  # let(:dishes) do
  #   {
  #     chicken: 2.99,
  #     beef: 3.49,
  #   }
  # end
  # let(:formatted_menu) { "Chicken - £3.00, Beef: £3.49" }




  describe '#new' do
    it "Initializes with an empty hash and argument menu" do
    expect(example_order.ordered).to be_empty
    end

    it "Initializes with an empty hash and argument menu" do
    expect(example_order.menu).to eq restaurant_menu
    end



  end
end
#
#
# menu = dishes & print_menu
