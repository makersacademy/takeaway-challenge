require 'order'

describe Order do

  subject(:order) { described_class.new(menu: menu_dbl) }
  let(:menu_dbl) { instance_double("Menu") }

  let(:items) do
    {
      chicken_curry: 2,
      veggie_pizza: 1,
      chilli_sauce: 2
    }
  end

  before do
    allow(menu_dbl).to receive(:dish?).with(:chicken_curry).and_return(true)
    allow(menu_dbl).to receive(:dish?).with(:veggie_pizza).and_return(true)
    allow(menu_dbl).to receive(:dish?).with(:chilli_sauce).and_return(true)
    allow(menu_dbl).to receive(:price).with(:chicken_curry).and_return(6)
    allow(menu_dbl).to receive(:price).with(:veggie_pizza).and_return(5.5)
    allow(menu_dbl).to receive(:price).with(:chilli_sauce).and_return(1.5)
  end

  context '#add_item' do

    it "adds several dishes to the order" do
      order.add_item(:chicken_curry, 2)
      order.add_item(:veggie_pizza, 1)
      order.add_item(:chilli_sauce, 2)
      expect(order.items).to eq(items)
    end

    it "doesn't allow us to add items that are not on the menu" do
      allow(menu_dbl).to receive(:dish?).with(:fish_soup).and_return(false)
      expect {order.add_item(:fish_soup, 1)}.to raise_error "Sorry, fish_soup is not available today"
    end
  end

  context '#order_total' do
    it "calculates the order total" do
      order.add_item(:chicken_curry, 2)
      order.add_item(:veggie_pizza, 1)
      expect(order.order_total).to eq(17.5)
    end

  
  end


end
