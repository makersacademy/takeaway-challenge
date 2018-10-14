require 'order_view'

describe OrderView do
  let(:name) { 'name' }
  let(:price) { 8 }
  let(:dish) { double :dish, name: name, price: price }
  let(:dish_view) { double :dish_view, display: "dishes" }
  let(:dish_view_class) { double :dish_view_class, new: dish_view }
  let(:item_list) { [[dish, 1], [dish, 2]] }
  let(:order) { double :order, item_list: item_list, total: 24 }
  subject { described_class.new(order, dish_view_class) }

  describe "#display" do
    it "displays the items' views' in the order" do
      expect(dish_view_class).to receive(:new).with(dish).twice
      subject.display
    end

    it "displays the items' views' in the order" do
      allow(dish_view_class).to receive(:new).with(dish).and_return(dish_view)
      expect(dish_view).to receive(:display)
      subject.display
    end

    it "displays the order total" do
      expect(order).to receive(:total)
      subject.display
    end

  end
end
