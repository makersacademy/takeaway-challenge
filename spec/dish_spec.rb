require 'dish'

describe Dish do
  it 'can be initialized with a name, price and description' do
    murtabak = described_class.new 'Murtabak', 10, 'It\'s yummy'
    expect(murtabak.name).to eq 'Murtabak'
    expect(murtabak.price).to eq 10
    expect(murtabak.description).to eq 'It\'s yummy'
  end

  it 'can change/be given name' do
    subject.name = 'Murtabak'
    expect(subject.name).to eq 'Murtabak'
  end

  # Assumption: only one currency
  it 'can change/be given price' do
    subject.price = 10
    expect(subject.price).to eq 10
  end

  it 'can change/be given description' do
    subject.description = 'Mild chicken curry in a soft pastry'
    expect(subject.description).to eq 'Mild chicken curry in a soft pastry'
  end
end
