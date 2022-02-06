require_relative '../lib/order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double("menu", :dishes => [chicken, pizza]) }
  let(:chicken) { double("dish1") }
  let(:pizza) { double("dish2") }
  let(:coke_not_on_menu) { double("dish3") }

  describe '#select' do

    it "can select multiple of the same dish" do
      order.select(chicken)
      order.select(chicken)
      expect(order.dishes).to include chicken, chicken
    end

    it "can select more than one dish" do
      order.select(chicken)
      order.select(pizza)
      expect(order.dishes).to include chicken, pizza
    end

    it "cannot select a dish not on the menu" do
      expect { order.select(coke_not_on_menu) }.to raise_error "Dish not on menu."
    end

  end

  describe "#view" do
    before do
      allow(chicken).to receive(:price) { 2.0 }
      allow(chicken).to receive(:name) { "Chicken" }
      allow(pizza).to receive(:price) { 5.50 }
      allow(pizza).to receive(:name) { "Pizza" }
      order.select(chicken)
      order.select(pizza)
    end

    it "calculates the running total of the order" do
      expect(order.total).to eq 7.5
    end

    it "prints order" do
      order.select(chicken)
      str = "Chicken: £2.00\nPizza: £5.50\nChicken: £2.00"
      str += "\n--------------------\n\nCurrent total = £9.50"
      expect(order.view).to eq(str)
    end

  end

  describe "#complete" do
    it "completes an order" do
      order.select(chicken)
      expect(order).to be_complete
    end
    
    it "raises an error if order is empty" do
      expect { order.complete? }.to raise_error "Order is empty."
    end

  end

end
