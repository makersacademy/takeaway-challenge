require 'order'
describe Order do
  it 'starts out empty' do
    expect(subject.summary).to be_empty
  end
  let(:dish) { double "dish", :name => "garlic bread", :price => 3.95 }
  it 'can add dishes to the summary' do
    subject.add(dish)
    expect(subject.summary).to include(dish)
  end
  it 'has a total' do
    subject.add(dish)
    subject.add(dish)
    expect(subject.total).to eq(2 * dish.price)
  end
end
