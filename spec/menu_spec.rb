require 'menu'

describe Menu do

  it 'calling import on menu provides a full menu' do
    expect(subject.import).to eq Menu::FULL_MENU
  end  
  
end
