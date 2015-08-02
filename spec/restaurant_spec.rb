require 'restaurant'

describe Restaurant do

  it 'has a menu of dishes with prices' do
    expect(subject.menu).to eq({margherita: 5, pepperoni: 6, hawaiian: 6, supreme: 7})
  end

  it 'allows to choose one or more of the same dishes' do
    expect(subject).to respond_to(:choose).with(2).arguments
  end

  it 'stores the choice the right number of times' do
    subject.choose(2, "margherita")
    expect(subject.selected).to eq({margherita: 2})
  end

  it 'raises an error if the selected dish is not on the menu' do
    expect{subject.choose(1, "banana")}.to raise_error "Your choice is not on the menu"
  end

  it 'stores a total price for the selected dishes' do
    subject.choose(3, "margherita")
    subject.choose(2, "pepperoni")
    expect(subject.total_price).to eq 27
  end

  it 'can receive an order' do
    subject.choose(2, "margherita")
    subject.choose(1, "pepperoni")
    expect(subject.place_order(16)).to eq true
  end

  it 'raises an error if the expected amount does not match the actual total' do
    subject.choose(2, "margherita")
    subject.choose(1, "pepperoni")
    expect{subject.place_order(12)}.to raise_error "Your expected amount does not match the total price for the selected dishes"
  end

end
