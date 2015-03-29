require 'dish'
describe Dish do
  new("Chicken curry")
  it 'has a name' do
    expect(subject.name).to eq "Chicken curry"
  end
end
