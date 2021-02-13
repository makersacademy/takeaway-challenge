require 'takeaway'

describe Takeaway do
  it 'displays the menu' do
    expect(subject.menu).to eq({'bibimbap'=>10, 'bulgogi'=>10, 'naengmyeon'=>8})
  end
  it 'displays the basket' do
    expect(subject.basket).to eq([])
  end

    describe '#add_to_basket' do
      it 'adds an item and price to the basket' do
        takeaway = Takeaway.new
        takeaway.add_to_basket('bibimbap')
        expect(takeaway.basket).to eq(['bibimbap, 10'])
      end
    end
end
