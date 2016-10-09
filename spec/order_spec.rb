require 'order'

describe Order do

  subject{described_class.new(menu, interface)}

   let(:menu) {double(:menu, "1" => "Pizza", "2" => "Steak")}
   let(:interface) {double(:interface)}

   subject{described_class.new(menu, interface)}

   it {is_expected.to respond_to(:add_dish).with(1).argument}

  # let(:prices) {double: prices, "1" => 5, "2" => 10}}
  #  let(:selection) {double(:current_selection, [1, 3])}
  # let(:orders_array) {double(:orders_array, [[2, 3, 30], [1, 1, 5]])}


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
      allow(interface).to receive(:select_quantity)
      allow(interface).to receive(:add_or_review)
      allow(menu).to receive(:prices).and_return 2
      allow(menu).to receive(:menu). and_return 2
      subject.add_dish(5)
      subject.add_quantity(8)
      expect(subject.current_selection.last).to eq 8
    end
  end

  # describe '#calculate_subtotal' do
  #   it 'calculates the the cost a single item request (dish * quantity)' do
  #     expect
  #   end
  # end
  #
  # describe '#reset order' do
  #   it 'resets the order' do
  #
  #
  #   end
  # end


end
