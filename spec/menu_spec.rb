require 'menu'

describe Menu do

  let(:takeaway) { double :takeaway }

  it 'has default menu' do
    expect(subject.menu).to eq Menu::MENU
  end

  it 'checks price of food item' do
    expect(subject.price("Milo")).to be(2.5)
  end
  
end
