require 'order'

describe Order do
  subject(:order) { described_class.new(Menu.new) }

  describe '#add_item' do

    it "should raise an error if the dish is not in the menu" do
      expect { order.add_item("pizza", 1) }.to raise_error "cannot find item pizza in the menu, please try again"
    end

    it "should add any valid item from the menu and store in basket" do
      order.add_item("green curry", 1)
      expect(order.basket).to include("green curry")
    end

    it "should return a confirmation message when the item is added to the basket" do
      expect(order.add_item("green curry", 1)).to eq "1 x green curry(s) added to your basket"
    end

    it "should add 1 x dish by default" do
      order.add_item("green curry")
      expect(order.basket["green curry"]).to eq 1
    end

    it "should add quantities to already selected dishes" do
      order.add_item("green curry", 1)
      order.add_item("green curry", 1)
      expect(order.basket["green curry"]).to eq 2
    end
  end

    describe '#view_basket' do

      it "should return a list of items with their quantity and total price" do
        order.add_item("green curry", 1)
        order.add_item("fried rice", 1)
        expect{ order.view_basket }.to output("\"green curry x 1 = £8.0\"\n\"fried rice x 1 = £5.0\"\n").to_stdout
    end
  end

    describe '#sum_total' do

      it "should calculate the total value of an order" do
        order.add_item("green curry", 2)
        order.add_item("sticky rice", 2)
        order.add_item("crab cakes", 1)
        expect(order.sum_total).to eq 31.0
      end
    end

end
