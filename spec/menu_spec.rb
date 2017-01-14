require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      dumplings: 5.00,
      tomato_soup: 6.00,
      apple_pie: 2.50
    }
  end

  context 'on initialization' do
    describe '#dishes' do
      it 'contains a list of dishes with prices' do
        expect(menu.dishes).to eq(dishes)
        # expect(menu.dishes.length).to eq 3
        # expect(menu.dishes.first).to be_a Dish
        # expect(menu.dishes.first.price).to eq 5
        # expect(menu.dishes.first.name).to eq "dumplings"
      end
    end
  end

  describe '#print_menu' do
    it 'prints a list of dishes with prices' do
      printed_menu = "Dumplings £5.00, Tomato_soup £6.00, Apple_pie £2.50"
      expect(menu.print_menu).to eq(printed_menu)
    end
  end


  # context 'it lets a customer order a menu item'
  #   it 'return a dish when ordered' do
  #     expect(menu.order("apple pie")).to have_attributes(name: "apple pie")
  #   end
  #
  #   it "raises an error if the item is not on the menu" do
  #     expect { menu.order("french fries") }.to raise_error("Item not on the menu. Would you like to select a different dish?")
  #   end
  # end
end
