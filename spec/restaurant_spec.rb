require "./lib/restaurant"
require "./lib/menu"
require "./lib/dish"

describe Restaurant do

  subject do
    dishes = [Dish.new("Burger", 8), Dish.new("Pizza", 10)]
    menu = Menu.new(dishes)
    notification_service = instance_double "Notificationservice"
    allow(notification_service).to receive(:send_notification)
    Restaurant.new(menu, notification_service)
  end

  it "has a menu" do
    expect(subject.menu.dishes.length).to eq(2)
  end

  it "can recieve order" do
    burger = Dish.new("Burger", 8)
    pizza = Dish.new("Pizza", 10)
    order_dishes = {burger => 1,
                    pizza => 2}
    order = subject.submit_order("Sarah", "0123456789", order_dishes, 28)
    expect(order.customer_name).to eq("Sarah")
  end

  it "raises an error when trying to order a dish not on the menu" do
    dishes = {Dish.new("Sushi", 20) => 1}
    expect{subject.submit_order("Sarah", "0123456789", dishes, 28)}.
      to raise_error "Dish not on menu"
  end

  it "raises an error if expetced sum is incorrect" do
    burger = Dish.new("Burger", 8)
    pizza = Dish.new("Pizza", 10)
    order_dishes = {burger => 1,
                    pizza => 2}
    expect{subject.submit_order("Sarah", "0123456789", order_dishes, 14)}.
      to raise_error "Sum is incorrect"
  end

  context "text messages" do
    let(:notification_service) {instance_double "Notificationservice"}

    subject do
      dishes = [Dish.new("Burger", 8), Dish.new("Pizza", 10)]
      menu = Menu.new(dishes)
      allow(notification_service).to receive(:send_notification)
      Restaurant.new(menu, notification_service)
    end

    it "sends a text message when order is submitted" do
      burger = Dish.new("Burger", 8)
      order_dishes = {burger => 1}
      expect(notification_service).to receive(:send_notification).
        with("0123456789",
          /Thank you! Your order was placed and will be delivered before [0-9]{1,2}:[0-9]{2}/)
      subject.submit_order("Sarah", "0123456789", order_dishes, 8)
    end
  end

end