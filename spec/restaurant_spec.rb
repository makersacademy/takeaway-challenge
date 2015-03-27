require 'restaurant'

describe Restaurant do
  it 'can list all dishes' do
    expect(subject.dishes).to eq(chicken: '£1', fish: '£1')
  end
end