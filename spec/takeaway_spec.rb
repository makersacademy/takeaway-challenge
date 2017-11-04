require 'takeaway'

describe Takeaway do

  let(:subject) { described_class.new }
  let(:items)   do  [
                      { name: 'Chicken', price: 5, amount: 1 },
                      { name: 'Burger', price: 4, amount: 1 }
                    ]
                end
  let(:text) { Text.new }


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
      expect { subject.choose_item('Chicken') }
        .to change { subject.total }.by(5)
    end

    it 'adds amount to total for burger menu item' do
      expect { subject.choose_item("Burger") }
        .to change { subject.total }.by(4)
    end
  end

  describe '#add_to_items' do
    it 'adds hash to items array' do
      expect { subject.add_to_items('Chicken') }
        .to change { subject.items.length }.by(1)
    end
  end

  describe '#finalize_order' do
    it 'sends text' do
      # expect(subject.finalize_order).to respond_to(text.send_text(1)).with(1).argument
    end
  end
end
