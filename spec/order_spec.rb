require 'order'

describe Order do
  subject {described_class.new}
  it 'initialises a @items empty hash to store the list of ordered dishes' do
    expect(subject.items).to eq({})
  end
  it 'add the dishes to the list of items' do
    subject.add_dish("marinara", 2)
    subject.add_dish("marinara", 2)
    subject.add_dish("calzone")
    expect(subject.items).to eq({ "marinara" => 4, "calzone" => 1 })
  end
end
