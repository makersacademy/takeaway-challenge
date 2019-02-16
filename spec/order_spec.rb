require 'order'

describe Order do
  it 'starts with empty order list' do
    expect(subject.contents).to be_empty
  end

  context 'takes on new items to order' do
    it 'adds a new item' do
      subject.add("fish", 3)
      expect(subject.contents).to include(:item => "fish", :quantity => 3)
    end

    it 'increases order quantity if adding the same item again' do
      subject.add("fish", 3)
      subject.add("fish", 2)
      expect(subject.contents[0][:quantity]).to eq(5)
    end
  end
end
