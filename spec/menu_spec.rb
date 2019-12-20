require 'menu'

describe 'Menu' do

  it 'creates a new instance of the Menu class' do
    expect(Menu.new).to be_instance_of Menu
  end

  it 'returns the list of dishes available' do
    expect(subject).to respond_to(:show_dishes)
  end
  
end
