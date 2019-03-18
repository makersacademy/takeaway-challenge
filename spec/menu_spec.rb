require "menu"

describe Menu do
  subject { Menu.new }
  
  let(:dish) { double :dish }
  let(:dish_class) { double :dish_class, new: dish }

  context "when looking for dishes" do
    it { is_expected.to respond_to(:view_dishes) }

    it "displays dishes" do
      subject.add_dish("burger", 10, dish_class)
      expect(subject.view_dishes).to include dish
    end
  end
  
  context "when managing orders" do
    let(:order) { double :order }
    let(:order_class) { double :order_class, new: order }

    context "when creating an order" do
      it { is_expected.to respond_to(:select_dish) }
  
      it "creates a new order for first dish selected" do
        expect { subject.select_dish(dish, 1, order_class) }.to change { subject.orders.length }.by(1)
      end
  
      it "existing order updates for second dish added" do
        subject.orders << order
        allow(order).to receive(:confirmed?).and_return(false)
        expect(order).to receive(:update)
        subject.select_dish(dish, 1, order_class)
      end
    end
  
    context "when viewing an order" do
      it "displays selected dishes" do
        subject.orders << order
        expect(order).to receive(:view_selected).and_return(dish)
        subject.orders[0].view_selected
      end
    end
  end  
end
