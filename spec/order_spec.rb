require 'order'

describe Order do
  let(:dish) { double("dish") }

  it { is_expected.to be_instance_of(Order) }

  it { is_expected.to respond_to(:view_menu) }

  it { is_expected.to respond_to(:select) }

  it { is_expected.to respond_to(:place_order) }

  describe '#view_menu' do
    it "displays the menu" do
      menu = "Pizza: £6.50\nSpaghetti: £5.75\nSalad: £5.25"
      expect(subject.view_menu).to eq menu
    end
  end

  describe '#select' do
    it "saves the selected dish to the order" do
      allow(dish).to receive_messages(downcase: dish, to_sym: dish)
      expect { subject.select(dish, 1) }.to change { subject.order }
    end

    it "saves the correct quantity of dishes to the order" do
      allow(dish).to receive_messages(downcase: dish, to_sym: dish)
      expect { subject.select(dish, 2) }.to change { subject.order }
    end
  end

  describe '#order_summary' do
    it "creates array of dish names" do
      allow(dish).to receive(:name)
      expect(subject.order_summary).has_key?(dish.name)
    end
  end

  describe '#place_order' do
    it "returns list of dishes, "
  end
end
