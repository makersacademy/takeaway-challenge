require 'takeaway'

describe Takeaway do
  it 'displays the menu' do
    expect(subject.menu).to eq({'bibimbap'=>10, 'bulgogi'=>10, 'naengmyeon'=>8})
  end
  it 'displays the basket' do
    expect(subject.basket).to eq([])
  end

  #context 'adding to order' do
  #  describe '#select'
  #end
end
