require './lib/dishes_list.rb'

describe DishesList do

  subject {described_class.new("Salad", 4)}

  it 'instantiates the class with 2 arguments' do
    expect(subject).to be_an_instance_of(DishesList)
  end

  it 'sets name to the first argument' do
    expect(subject.name).to eq("Salad")
  end

  it 'sets price to the second argument' do
    expect(subject.price).to eq(4)
  end

end
