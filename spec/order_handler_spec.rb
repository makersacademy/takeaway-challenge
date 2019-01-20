require 'order_handler'

describe OrderHandler do
  let(:menu) { double :menu, :items => ({ "Pizza" => 15, "Goat" => 22 }) }

  describe "#see_list" do
    it 'returns a menu' do
      handler = OrderHandler.new(menu)
      expect(handler.see_list).to eq [["Pizza", 15], ["Goat", 22]]
    end
  end

  describe "#select_dish" do
    it 'stores an argument in selected dishes' do
      handler = OrderHandler.new
      handler.select_dish("Pizza")
      expect(handler.instance_variable_get(:@selected_dishes)).to eq ({ "Pizza" => 1 })
    end

    it 'accepts a second parameter which it also stores' do
      handler = OrderHandler.new
      handler.select_dish("Pizza", 3)
      expect(handler.instance_variable_get(:@selected_dishes)).to eq ({ "Pizza" => 3 })
    end
  end

  describe "#order" do
    it 'returns a list showing name, quantity & total price' do
      handler = OrderHandler.new(menu)
      handler.instance_variable_set(:@selected_dishes, { "Pizza" => 3 })
      expect(handler.order).to eq [["Pizza", 3, 45]]
    end
  end
end
