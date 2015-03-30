require 'takeaway'

describe Takeaway do
  it 'should display a menu of items' do
    menu_hash = { bread_and_water: '9.99', bread: '9.00', water: '0.99' }
    expect(subject.menu).to eq menu_hash
  end

  it 'should format the menu properly' do
    menu_formatted = 'Bread and water 9.99'
    expect(subject.full_menu).to include menu_formatted
  end

  it 'allows the customer to select items' do
    subject.select('bread and water')
    expect(subject.cart).to eq ['bread and water']
  end

  it 'raises error if customer tries to place wrong order' do
    expect { subject.place_order('pie') }.to raise_error
    'food item not recognised'
  end

  it 'allows a customer to delete items' do
    subject.place_order('bread and water')
    subject.remove('bread and water')
    expect(subject.cart).to eq []
  end
end
