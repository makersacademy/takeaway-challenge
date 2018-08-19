require 'order'

describe Order do
  let(:mockDish) { double :dish }

  it "intitializes with an empty basket" do
    expect(subject.basket).to be_empty
  end

  it "can add items to its basket" do
    subject.add(mockDish)
    expect(subject.basket).to include mockDish
  end

  it "can remove items from the basket" do
    subject.add(mockDish)
    subject.remove(mockDish)
    expect(subject.basket).to_not include mockDish
  end

end