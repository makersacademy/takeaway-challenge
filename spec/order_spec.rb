require 'order'
require 'menu'

describe Order do
  describe "#initialize" do
    it "initializes with a total of 0" do
      expect(subject.total).to eq(0)
    end
    it "initializes with an empty final order" do
      expect(subject.final_order).not_to be nil
    end
  end

  describe "#checkout" do
    it "move the customers basket to final order" do
      menu = Menu.new
      menu.select_dish(2, 1)
      menu.checkout
      expect(menu.order.final_order).to eq [{ "2. Ham and Pineapple" => 9 }]
    end
    it "adds up the total" do
      menu = Menu.new
      menu.select_dish(2, 1)
      menu.checkout
      menu.order.total_order
      expect(menu.order.total).to eq(9)
    end
    it "doesn't let the customer order if the basket is 0" do
      message = "basket empty"
      expect { subject.total_order }.to raise_error message
    end
  end
end
