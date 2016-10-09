require 'order'
require 'menu'

describe Order do


   let(:interface) {double(:interface)}

   subject{described_class.new(Menu.new, interface)}

   menu = Menu.new

  describe '#initialize' do
    it 'contains an empty order array' do
      expect(subject.orders_array.count).to eq 0
    end
    it 'contains an empty current order array' do
      expect(subject.current_selection.count).to eq 0
    end
    it 'initializes with a running total of 0' do
      expect(subject.running_total).to eq 0
    end
  end

  describe 'add_dish' do
    it 'adds a dish to the current order array' do
      allow(interface).to receive(:select_quantity)
      subject.add_dish(5)
      expect(subject.current_selection).to include 5
    end
  end

  describe 'add_quantity' do
    it 'adds a quantity to the current order array' do
      allow(interface).to receive(:select_quantity).and_return "5"
      allow(interface).to receive(:add_or_review)
      allow(interface).to receive(:return_order)
      subject.add_dish(1)
      subject.add_quantity(5)
      expect(subject.current_selection[1]).to eq 5
    end
  end

  describe 'calculate_subtotal' do
    before do
      allow(interface).to receive(:select_quantity).and_return "5"
      allow(interface).to receive(:add_or_review)
      allow(interface).to receive(:return_order)
    end
    it "uses the provided quantity to base its calculation" do
      subject.add_dish(5)
      subject.add_quantity(6)
      expect(subject.current_selection[1]).to eq 6
    end
    # it 'calculates the price of the current_selection' do
    #   unit_price = 5.5
    #   subject.add_dish(5)
    #   subject.add_quantity(2)
    #   subject.unit_price_lookup
    #   expect(subject.calculate_subtotal(unit_price)).to eq 11
    # end
  end

  describe '#unit_price_lookup' do
    before do
      allow(interface).to receive(:select_quantity).and_return "5"
      allow(interface).to receive(:add_or_review)
      allow(interface).to receive(:return_order)
    end
    it 'looks in the menu for the price of a dish' do
      subject.add_dish(5)
      subject.add_quantity(1)
      expect(menu.prices[subject.current_selection[0]]).to eq 5.50
    end
  end

  describe '#reset_order' do
    before do
      allow(interface).to receive(:select_quantity).and_return "5"
      allow(interface).to receive(:add_or_review)
      allow(interface).to receive(:select_dish)
      subject.add_dish(5)
      subject.add_quantity(1)
      subject.reset_order
    end
    it 'resets the current_selection array' do
      expect(subject.current_selection).to eq []
    end
    it 'resets the orders array' do
      expect(subject.orders_array).to eq []
    end
  it 'resets the running_total value' do
    expect(subject.running_total).to eq 0
  end
end

  context 'selecting more than one dish' do
    before do

    allow(interface).to receive(:select_quantity).and_return "5"
    allow(interface).to receive(:add_or_review)
    allow(interface).to receive(:return_order)
  end
    # it 'allows for multiple dishes to be stored in the orders array' do
    #       unit_price = 5
    #   subject.add_dish(5)
    #   subject.build_orders_array
    #   subject.add_dish(2)
    #   subject.build_orders_array
    #   expect(subject.orders_array.count).to eq 2
    # end

  end

end
