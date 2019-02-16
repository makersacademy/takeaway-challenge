require 'order'

describe Order do
  it 'is initialized with a blank list of dishes' do
    expect(subject.selected_dishes).to eq []
  end

  it 'returns the total amount' do
    expect(subject.total).to eq 10
  end

  it 'adds a dish to its selected_dishes instance variable' do
    rice = double(:price => 3, :name => "rice")
    subject.add_dish(rice)
    expect(subject.selected_dishes). to include rice
  end

  pending 'it sends an SMS confirmaton'
end
