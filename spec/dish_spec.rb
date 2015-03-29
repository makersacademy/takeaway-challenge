require 'dish'
describe Dish do
  before(:each) do
    subject.new("Chicken curry")
  end
  it 'has a name' do
    expect(subject.name).to eq "Chicken curry"
  end
end
