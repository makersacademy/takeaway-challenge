require 'menu'

describe Menu do

  it 'should give user a list of menu dishes' do
    expect(subject.menu_dishes).to eq('food')
  end
end