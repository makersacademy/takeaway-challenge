require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:print_menu) { "chow mein is 5.0, sweet sour chicken is 6.0" }
  let(:order) { instance_double("Order", basket: { :"chow mein" => [2, 5.0] }) }

  describe "#menu" do
    it "has a list of dishes with prices" do
      expect(takeaway.menu).to eq print_menu
    end
  end

  describe "#calculate_total" do
    it 'can calculate the total of the order' do
      takeaway.place_order(order)
      expect(takeaway.calculate_total).to eq 10.0
    end
  end

  describe "#verify order" do
    it 'can verify the final order' do
      expect(order).to receive(:current_value)
      takeaway.verify_order(order)
    end
  end
end
