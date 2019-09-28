require 'dish'

describe Dish do
  description = "Fans of fungal cuisine can't resist this simple mushroom-skewer dish. Very filling." 
  subject(:dish) { described_class.new(cost: 500, name: 'Copius Mushroom Skewers', description: description) }
  it "knows its price" do
    expect(subject.cost).to eq 500
  end

  it 'knows its name' do
    expect(subject.name).to eq 'Copius Mushroom Skewers'
  end

  it 'knows its description' do
    expect(subject.description).to eq "Fans of fungal cuisine can't resist this simple mushroom-skewer dish. Very filling."
  end
end