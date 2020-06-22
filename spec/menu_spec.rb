require 'menu'

describe Menu do
  let(:menu) { Menu.new(Hummus: 2, Potato: 1) }
    
  it 'knows the prices of dishes in pounds' do
    expect(menu.list[:Potato]).to eq 1
  end
end