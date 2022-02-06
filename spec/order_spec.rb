require_relative '../lib/order'

describe Order do
  subject(:order){described_class.new(menu)}
  let(:menu){ double("menu", :dishes => [chicken, pizza]) }
  let(:chicken){ double("dish1") }
  let(:pizza){ double("dish2") }
  let(:coke_not_on_menu){ double("dish3") }

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
      expect{order.select(coke_not_on_menu)}.to raise_error "Dish not on menu."
    end
  end
end