require 'order'

describe Order do

  it 'can respond to choose items' do
    expect(subject).to respond_to(:choose_item)
  end

  it 'can choose items from the menu' do
    expect(subject.choose_item(item,quantity)).to eq[{carbonara: 19}]
  end

    
end
