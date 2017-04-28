require 'menu'

describe Menu do
  it 'cointains a list of dishes' do
    expect(subject.menu).to include({ 1 => { dish: 'Whole Chicken', price: 11.50 } })
  end
  it 'prints a copy of the menu' do
    expect(subject).to respond_to(:show)
  end
end
