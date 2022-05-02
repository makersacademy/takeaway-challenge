require 'menu'

describe Menu do
  it 'can display list of available items' do 
    expect(subject.dishes).to include({name: 'Cacio e pepe', price: 10})
  end
end