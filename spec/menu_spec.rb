require 'menu'

describe Menu do

  let(:takeaway) { double :takeaway }

  it 'has default menu' do
    expect(subject.menu).to eq Menu::MENU
  end
  
end
