require 'calculate_bill'

describe CalculateBill do

subject {CalculateBill.new(["PhadThai", "SpringRolls"])}

it {is_expected.to respond_to(:customer_order)}
it {is_expected.to respond_to(:calculate_starters)}
it {is_expected.to respond_to(:calculate_mains)}
it {is_expected.to respond_to(:calculate_total)}
it {is_expected.to respond_to(:menu)}



  describe "#initialize"do
    context "when an order has been placed" do
      it 'sends order to this calculate bill' do
        expect(subject.customer_order.empty?).to be false
    end
  end
end

describe "#calculate_starters"do
  context "when a customer order has been passed to calculator" do
    it 'calculates the value of the starters' do
      expect(subject.calculate_starters).to eq "4.00"
  end
end
end

describe "#calculate_mains"do
  context "when a customer order has been passed to calculator" do
    it 'calculates the value of the main courses' do
      expect(subject.total_value).to eq "9.50"
  end
end
end

describe '#menu' do
  context 'when a customer order is passed to calculator' do
    it 'creates a menu' do
      subject.create_menu
      expect(subject.menu).to be_instance_of(Menu)
    end
  end
end

end
