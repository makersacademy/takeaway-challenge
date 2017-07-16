require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:printed_menu) { "pizza is 8.0, rice is 7.0, chicken is 6.0" }
  let(:order) { instance_double("Order", current_orders: { :rice => [7, 7.0] }, current_value: true) }

  describe "#menu?" do
    it 'has a list of dishes with their prices' do
      expect(takeaway.menu?).to eq true
    end
  end

  describe "#print_menu" do
    it 'prints a menu' do
      expect(takeaway.print_menu).to eq printed_menu
    end
  end

  describe "#place_order" do
    it 'can place an order' do
      expect(order).to receive(:current_orders)
      takeaway.place_order(order)
    end
  end

  describe "#calculate_total" do
    it 'can calculate the total order' do
      takeaway.place_order(order)
      expect(takeaway.calculate_total).to eq 49.0
    end
  end

  describe "#verify_order" do
    it 'can verify the final order' do
      expect(order).to receive(:current_value)
      takeaway.verify_order(order)
    end
  end
end
