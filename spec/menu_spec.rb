require 'menu'

RSpec.describe Menu do

  it 'prints menu so customer can order food' do
    expect(subject.print).to eq(subject.menu_items)
  end
  
  it 'has a list of food items and prices' do
    expect(subject.menu_items).to eq({pizza: 2.99, burger: 3.50, burrito: 4.50, 
    lobster: 50.00})
  end

end


