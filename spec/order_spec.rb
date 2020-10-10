require './lib/order'
describe Order do
  describe '#add' do
    it 'add items from the menu to the order' do
      expect { subject.add("dish", 20, 1) }.to(change { subject.order })
    end
  end

  describe '#veiw' do
    it "can veiw dishes in the order" do
      subject.add("Seafood Linguine", 30, 1)
      subject.add("Pizza", 18, 1)
      subject.add("Carbonara", 26, 1)
      expect(subject.view).to eq(subject.order)
    end
  end
end
