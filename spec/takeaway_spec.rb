require 'takeaway'
describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:list) { Takeaway::LIST }
  let(:order_quantities) { {"mushy peas" => 1, "kebab" => 1, "fish" => 1, "chips" => 2} }

  describe '#show_menu' do
    it 'provides a list of dishes with prices' do
      expect(takeaway.show_menu).to eq list
    end
  end
  context 'When order is placed' do
    before do
      takeaway.take_order(order_quantities, 16)
    end
    describe '#take_order' do
      it "records the list of dishes with their quantities" do
        expect(takeaway.order_quantities).to eq order_quantities
      end
      it "records my total" do
        expect(takeaway.my_total).to eq 16
      end
    end
    describe '#total' do
      it "works out the total price of the dishes ordered" do
        expect(takeaway.total).to eq 16
      end
    end
    context 'After the total price is calculated' do
      before do
        takeaway.total
      end
      describe '#match_total?' do
        it "checks if total equals my total" do
          expect(takeaway.match_total).to be true
        end
      end
      describe '#text' do
        it "confirms order by text" do
            expect(takeaway.text).to eq "Sent message!"
        end
      end
    end
  end
  context "If total is not equal to my total" do
    it 'returns an error' do
      takeaway.take_order(order_quantities, 10)
      takeaway.total
      expect{ takeaway.match_total }.to raise_error("Your sum is not correct!")
    end
  end
end
