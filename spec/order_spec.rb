require 'order'

describe Order do
  it 'keeps track of items added' do
    subject.add(:some_food)
    subject.add(:more_food)
    expect(subject.list).to eq [:some_food, :more_food]
  end
end
