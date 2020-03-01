require 'order'

describe Order do

  it { expect(described_class).to be < Takeaway }

  describe '#initialize' do
    it 'create empty array' do
      expect(subject.order_items). to eq []
    end
  end

  describe '#add' do
    before(:each) do
      subject.add("Garlic Bread", 2)
    end
    it 'adds items to the order_items' do
      expect(subject.order_items).to eq [{:item => "Garlic Bread", :amount => 2}]
    end
    it 'adds multiple items to the order' do
      subject.add("Romana", 1)
      expect(subject.order_items).to eq [{:item => "Garlic Bread", :amount => 2}, {:item => "Romana", :amount => 1}]
    end
  end

  describe '#check_total' do
    it 'should return and update the current total instance variable' do
      subject.add("Garlic Bread", 2)
      subject.add("Romana", 1)
      expect(subject.current_total).to_eq 20
    end
  end
end
