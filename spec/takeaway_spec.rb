require 'takeaway'

describe Takeaway do

  let(:subject) { described_class.new }
  let(:items) do [
                    { item: 'Chicken', price: 5 },
                    { item: 'Burger', price: 4 }
                  ]
              end

  let(:chicken) { 'Chicken' }

  describe "#items" do
    it 'should initialize as an empty array' do
      expect(subject.items).to be_a Array
    end
  end

  describe "#menu" do
    it "should initialize as an array" do
      expect(subject.items).to be_an Array
    end
  end

  describe '#choose_item' do
    it 'adds amount to total for chicken menu item' do
      expect { subject.add_to_items('chicken') }
        .to change { subject.items.length }.by(1)
    end

    it 'adds amount to total for burger menu item' do
      expect { subject.add_to_items("Burger") }
        .to change { subject.total }.by(4)
    end
  end

  describe '#add_to_items' do
    it 'adds hash to items array' do
      expect { subject.add_to_items(chicken) }
        .to change { subject.items.length }.by(1)
    end
  end

  describe '#check_total' do
    context 'double checks total' do
      it 'checks against previous total' do
        expect(subject.check_total)
          .to eq(subject.total)
      end
    end
  end

  describe '#finalize_order' do
    it 'sends text' do
      # expect(subject.finalize_order).to respond_to(:send_text).with(1).argument
    end
  end
end
