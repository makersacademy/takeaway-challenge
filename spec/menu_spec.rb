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
  
  context "when creating an order" do
    it { is_expected.to respond_to(:select_dish) }

    let(:order) { double :order }
    let(:order_class) { double :order_class, new: order }

    it "creates a new order for first dish selected" do
      expect(order_class).to receive(:new)
      subject.select_dish(dish, 1, order_class)
    end

    it "adds to existing order for second dish added" do
      # I want to mock an order that is not empty or confirmed
      # I want to test that calling subject.select_dish(dish, 2, order_class) calls :order.update()
      expect(order_class).to receive(:new)
      subject.select_dish(dish, 1, order_class)

      expect(order).to receive(:confirmed?).and_return(false)
      expect(order).to receive(:update)
      subject.select_dish(dish, 1, order_class)
    end
  end
end