require 'order'

describe Order do

let(:order) {described_class.new}


  describe "responds to" do

    it { is_expected.to respond_to(:place_order).with(1).argument }
    it { is_expected.to respond_to(:show_menu)}
  end

  describe "#show_menu dishes" do

    it "shows all dishes available on the menu" do
      expect(order.show_menu).to_not eq nil
    end

  end

  describe "placing an order" do
    let(:item) {double :item}

    describe "#place_order" do

      it "places an order" do
        expect{order.place_order(item)}.to change{order.final_order.count}.by(1)
        end
      end

  end
end