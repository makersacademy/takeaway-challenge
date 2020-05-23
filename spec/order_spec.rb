require_relative '../lib/order.rb'

describe Order do
  let(:name1) {double(:item)}
  let(:name2) {double(:item)}

  before do
    allow(name1).to receive(:name) {"name1"}
    allow(name2).to receive(:name) {"name2"}
  end

  describe '#add(item, number = 1)' do
    it 'should add the item to the order list' do
      subject.add(name1)
      expect(subject.order).to eq([{"name1" => 1}])
    end
    it "should record the quatity of each item" do
      subject.add(name1, 3)
      subject.add(name2, 2)
      expect(subject.order).
        to eq([{"name1" => 3}, {"name2" => 2}])
    end

  end

end
