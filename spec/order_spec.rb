require 'order'
describe Order do
  it 'starts out empty' do
    expect(subject.summary).to be_empty
  end
  describe '#add' do
    let(:dish) { double "dish" }
    it 'receives a Dish and adds it to the summary' do
      subject.add(dish)
      expect(subject.summary).to include(dish)
    end
  end
end
