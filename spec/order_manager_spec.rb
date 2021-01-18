require "order_manager"

describe OrderManager do

  let(:dish) { double(:dish1, name: "Naan", price: 1.95) }
  let(:dish2) { double(:dish2, name: "Rice", price: 3.50) }
  let(:order) { double(:order, time: Time.now, dishes: [dish2]) }
  let(:menu) { double(dishes_list: [dish, dish2]) }

  before(:each) do
    allow(subject).to receive(:send_sms).and_return("You will receive a confirmation SMS soon.")
    allow(subject).to receive(:menu).and_return(menu)
    allow(subject).to receive(:orders).and_return([order])
    allow(STDIN).to receive(:gets).and_return("2", "")
  end

  it "adds up prices of dishes" do
    expect(subject.prices_sum(menu.dishes_list)).to eq(dish.price + dish2.price)
  end

  describe "#create_order" do

    it "lists dishes" do
      expect { subject.print_dishes(menu.dishes_list) }.to output(/#{Regexp.quote(dish.name)}/).to_stdout
    end

    it "asks for user input" do
      expect { subject.ask_what_user_wants_to_order }.to output(/#{Regexp.quote("What would you like to order?")}/).to_stdout
    end

    it "gets user choice of dish for the order" do
      expect(subject.user_choice).to eq "2"
    end
    
    it "translates user input into dish choice" do
      expect(subject.dish_choice_from_input(subject.user_choice)).to eq dish2
    end

    it "prints out chosen dishes and subtotal during order creation" do
      expect { subject.create_order }.to output(/#{Regexp.quote(dish2.name)}/).to_stdout
    end
  end

  describe "makes and confirms orders" do
    it "makes an Order with user choice of dishes" do
      expect(subject.orders[-1].dishes).to include dish2
    end

    it "prints out the ordered dishes" do
      expect { subject.print_confirmation }.to output(/#{Regexp.quote(dish2.name)}/).to_stdout
    end

    it "has method for sending confirmation SMS" do
      expect(subject).to respond_to :send_sms
    end

    it "calculates estimated arrival time" do
      expect(subject.estimated_arrival_time(subject.orders[-1])).to eq(subject.orders[-1].time + described_class::DELIVERY_TIME)
    end
  end

end
