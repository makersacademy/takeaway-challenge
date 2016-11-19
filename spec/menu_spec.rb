require 'menu'

describe Menu do

  subject(:menu) {described_class.new(order)}
  let(:order) {double :order}

  context "Set up" do
    it "sets my order as empty as default" do
      expect(menu.my_order).to eq []
    end

    it "has a list of dishes with prices" do
      expect(menu.choices).to eq({burger: 10,  salad: 5, coke: 2})
    end
  end

  context "when selecting the dishes" do
    it "order 1 portion of burger from the menu and save it in my order array" do
      menu.select_dish(:burger, 1)
      expect(menu.my_order).to eq([{burger: 10}])
    end

    it "order 2 portions of burger and save it in my order array" do
      menu.select_dish(:burger, 2)
      expect(menu.my_order).to eq([{burger: 10}, {burger: 10}])
    end

    it "assumes 1 portion as a default" do
      menu.select_dish(:burger)
      expect(menu.my_order).to eq([{burger: 10}])
    end
  end

  context "when placing the order" do
    # it "creates a new order"do
    #   menu.select_dish(:burger, 2)
    #   menu.place_order(my_order)
    #
    # end



  end

end
