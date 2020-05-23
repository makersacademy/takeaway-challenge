require_relative '../lib/order.rb'

describe Order do

  describe '#add(item, number = 1)' do
    it 'should add the item to the order list' do
      subject.add("name1")
      expect(subject.order).to eq([{"name1" => 1}])
    end
    it "should record the quatity of each item" do
      subject.add("name1", 3)
      subject.add("name2", 2)
      expect(subject.order).
        to eq([{"name1" => 3}, {"name2" => 2}])
    end

  end

end
