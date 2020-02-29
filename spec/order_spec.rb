require 'order'

describe Order do

  subject(:order) { described_class.new(menu: menu_dbl) }
  let(:menu_dbl) { double(:menu) }

  let(:items) do
    {
      chicken_curry: 2,
      veggie_pizza: 1,
      chilli_sauce: 2
    }
  end

  context '#add' do

    it "adds several dishes to the order" do
      order.add_item(:chicken_curry, 2)
      order.add_item(:veggie_pizza, 1)
      order.add_item(:chilli_sauce, 2)
      expect(order.items).to eq(items)
    end
  end


end
