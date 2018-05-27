require 'order'
describe Order do

  describe '#add' do
    it 'can add to the order' do
      subject.add([["chicken", "10"], ["rice", "10"]])
      expect(subject.items).to eq({ "chicken" => 1, "rice" => 1 })
      expect(subject.total).to eq 20
    end
    it 'can add multiple items to the order' do
      subject.add([["chicken", "10"], ["chicken", "10"], ["chicken", "10"], ["rice", "10"]])
      expect(subject.items).to eq({ "chicken" => 3, "rice" => 1 })
      expect(subject.total).to eq 40
    end
  end

  describe '#show_order' do
    it 'can return the order with the total' do
      subject.add([["chicken", "10"], ["chicken", "10"], ["chicken", "10"], ["rice", "10"]])
      expect(subject.show_order).to eq("Your order was:\nchicken x 3\nrice x 1\n")
    end
  end
end
