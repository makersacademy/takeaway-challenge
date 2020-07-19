require 'menu'
describe Menu do
  it 'has a list of menu items with names' do 
    expect(subject.items[0][:name]).to eq "Chicken Wings"
  end
  it 'has a list of menu items with prices' do 
    expect(subject.items[0][:price]).to eq "3.00"
  end
end
