require 'dish'

describe Dish do

  subject {described_class.new('Chicken chow mein', 5)}

  it 'stores dishes name upon creation' do
    expect(subject.name).to eq 'Chicken chow mein'
  end

  it 'stores dishes price upon creation' do
    expect(subject.price).to eq 5
  end

end
