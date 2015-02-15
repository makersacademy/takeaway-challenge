require 'menu'

class Menu_Class; include Menu; end

describe Menu do
  let(:menu){Menu_Class.new}

it 'should have food & drink on initialization' do
  expect(menu.items).not_to be_empty
end

it 'should contain food' do
  expect(menu.food).to eq menu.items.keys
end

it 'should contain prices' do
  expect(menu.price).to eq menu.items.values
end


it 'should contain food with corresponding prices' do
  expect(menu.items.keys).to include{values :true}
end


end
