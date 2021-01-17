require "order_manager"
require "order"

describe OrderManager do

  let(:dish) { double(:dish1, name: "Naan", price: 195) }
  let(:dish2) { double(:dish2, name: "Rice", price: 350) }
  let(:order) { double(total_price: 1500) }
  let(:menu) { double(dishes_list: [dish, dish2]) }

  it "stores orders" do
    allow(STDIN).to receive(:gets).and_return("2", "")
    expect { subject.create_order(menu) }.to change { subject.orders.length }.by 1
  end

  it "adds up prices of selected dishes" do
    expect(subject.prices_sum(menu.dishes_list)).to eq (dish.price + dish2.price)
  end

  # it "allows user to create an order" do
  #   allow(subject).to receive(:create_order).and_return(order)
  #   expect(subject.create_order(menu).total_price).to eq 1500
  # end

  describe "#create_order" do

    before(:each) do
      allow(STDIN).to receive(:gets).and_return("2", "")
    end

    it "allows user to create an actual Order" do
      subject.create_order(menu)
      expect(subject.orders[-1].class).to eq Order
    end

    it "lists dishes" do
      expect { subject.print_dishes(menu.dishes_list) }.to output(/#{Regexp.quote(dish.name)}/).to_stdout
    end

    it "gets user choice of dish for the order" do
      expect(subject.get_user_choice).to eq "2"
    end

    it "asks for user input" do
      expect { subject.create_order(menu) }.to output(/#{Regexp.quote("What would you like to order?")}/).to_stdout
    end

    it "translates user input into dish choice" do
      expect(subject.process_choice(subject.get_user_choice, menu)).to eq dish2
    end

    it "makes an Order with user choice of dishes" do
      subject.create_order(menu)
      expect(subject.orders[-1].dishes).to include dish2
    end

    it "prints out chosen dishes and subtotal during order creation" do
      expect { subject.create_order(menu) }.to output(/#{Regexp.quote(dish2.name)}/).to_stdout
    end

  end

end
