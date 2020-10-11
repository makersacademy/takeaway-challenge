require './lib/order'
describe Order do
  describe '#add' do
    it 'add items from the menu to the order' do
      expect { subject.add("Pizza", 18, 1) }.to(change { subject.order })
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

  describe '#total' do
    it 'total order value' do
      subject.add("Seafood linguine", 30, 1)
      subject.add("Seafood linguine", 30, 1)
      subject.add("Pizza", 18, 1)
      subject.add("Carbonara", 26, 1)
      expect(subject.total_cost).to eq 104
    end 

    it 'total number if dishes ordered' do
      subject.add("Seafood linguine", 30, 1)
      subject.add("Seafood linguine", 30, 1)
      subject.add("Pizza", 18, 1)
      subject.add("Carbonara", 26, 1)
      expect(subject.dish_count).to eq 4
    end
  end
end
