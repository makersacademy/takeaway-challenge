require 'order'

describe Order do
  describe '#add' do
    it "adds to order" do
      subject.add("pizza", 2)
      expect(subject.basket).to eq({ "pizza" => 2 })
    end
  end
end
