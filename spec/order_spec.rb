require 'order'

describe Order do
  context 'giving it a menu' do
    let(:menu) { double :menu }
    let(:message) { double :message }
    subject { described_class.new(menu, message) }

    it 'when initialized it gets a menu' do
      expect(subject.menu).not_to be nil
    end

    context 'allowing the menu double to store items' do
      before do
        hash = {"Goan pork vindaloo" => 14.00, "Shahi murg" => 11.00}
        allow(menu).to receive(:menu_items).and_return(hash)
        allow(message).to receive(:send).and_return(true)
      end

      it 'lets you order somehting off the menu' do
        subject.whole_order("Goan pork vindaloo" => 1)
        expect(subject.my_order).to include("Goan pork vindaloo" => 14.00)
      end

      it 'ordering something adds it to the cheque' do
        expect { subject.whole_order("Goan pork vindaloo" => 1) }.to change { subject.cheque }.by 14.00
      end

      it 'raises an error if you order somethign off menu' do
        expect { subject.whole_order("Hamburger" => 1) }.to raise_error(Order::ITEM_ERROR)
      end

      it 'can take multiple orders at once' do
        expect { subject.whole_order({"Goan pork vindaloo" => 2, "Shahi murg" =>5}) }.to change { subject.cheque }.by 83
      end

      context "we're placing a whole order now" do
        before do
          subject.whole_order({"Goan pork vindaloo" => 2, "Shahi murg" =>5})
        end

        it 'can check if the order total matches the balance' do
          expect(subject.check_cheque?).to be true
        end
      end
    end
  end
end
