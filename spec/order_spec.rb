require 'order'

describe Order do
  let(:dish) { double("dish") }
  let(:menu) { double "menu" }
  subject { described_class.new(menu) }
  before(:each) do
    allow(dish).to receive_messages(downcase: dish, to_sym: dish, name: dish, select: dish, dishes: dish, values: dish, each: dish)
    allow(menu).to receive(:select).with(dish) { dish }
    allow(menu).to receive_messages(dishes: dish, values: dish, each: dish)
  end

  it { is_expected.to be_instance_of(Order) }

  it { is_expected.to respond_to(:view_menu) }

  it { is_expected.to respond_to(:select) }

  it { is_expected.to respond_to(:place_order) }

  describe '#view_menu' do
    it "displays the menu" do
      printed_menu = "Pizza: £6.50\nSpaghetti: £5.75\nSalad: £5.25"
      allow(menu).to receive(:view) { printed_menu }
      expect(subject.view_menu).to eq printed_menu
    end
  end

  describe '#select' do
    it "saves the selected dish to the order" do
      expect { subject.select(dish, 1) }.to change { subject.order }
    end

    it "saves the correct quantity of dishes to the order" do
      expect { subject.select(dish, 2) }.to change { subject.order }
    end
  end

  describe '#summary' do
    it "creates array of dish names" do
      subject.select(dish, 2)
      expect{ subject.summary }.to change { subject.order_summary }
    end
  end

# Also struggling with this test. I'm just going round in circles.
  # describe '#calculate total' do
  #   let(:order_summary) { double("order summary") }
  #   it "calculates total" do
  #     allow(dish).to receive_messages(price: 3)
  #     allow(dish).to receive_messages(quantity: 2, price_per_item: dish.price)
  #     subject.select(dish, 2)
  #     p subject.order
  #     allow(subject.order).to receive(:count) { 2 }
  #     subject.summary
  #     p subject.order_summary
  #     expect(subject.calculate_total(subject.order_summary)).to eq dish.price * 2
  #   end
  # end

  describe '#place_order' do
    it "returns list of dishes" do
      expect { subject.place_order }.to output.to_stdout
    end
  end
end
