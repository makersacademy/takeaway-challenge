require 'order'

describe Order do
  it 'is initialized with a blank list of dishes' do
    expect(subject.dishes).to eq []
  end

  it 'returns the total amount' do
    rice = double(:price => 3, :name => "rice")
    subject.add_dish(rice)
    expect(subject.total).to eq 3
  end

  it 'adds a dish to its selected_dishes instance variable' do
    rice = double(:price => 3, :name => "rice")
    subject.add_dish(rice)
    expect(subject.dishes). to include rice
  end

  pending 'it sends an SMS confirmaton'
end
