require 'dish'

describe Dish do
  subject { described_class.new("Sushi", 8.50) }
  it { expect(subject.name).to eq("Sushi") }
  it { expect(subject.cost).to eq(8.50) }

  it 'responds to alter' do
    dish_update = described_class.new("Sushi", 11.50)
    subject.alter(dish_update)
    expect(subject.cost).to eq(11.50)
  end

  it 'requires the name to be the same to alter' do
    dish_diff = described_class.new("Not Sushi", 5)
    expect { subject.alter(dish_diff) }.to raise_error(Dish::ERR_NO_MATCH)
  end

end
