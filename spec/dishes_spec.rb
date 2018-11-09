require 'dishes.rb'

describe Dishes do
  it 'checks that there is a dish class' do
    expect(Dishes.new).to be_instance_of Dishes
  end
  it 'checks that there is a list of dishes in the Dish class' do
    expect(subject.list_prices).to eq({"curry" => "£5", "rice" => "£2.50",
     "spare ribs" => "4.50"})
  end

end
