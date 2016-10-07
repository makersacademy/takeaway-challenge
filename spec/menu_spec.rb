require 'menu'

describe Menu do

  let(:dish) {double(:dish)}

  it 'is initialized with empty array' do
    expect(subject.dishes).to be_empty
  end

  describe '#add_dish' do
    it 'adds dish to the array' do
      subject.add_dish(dish)
      expect(subject.dishes).to include dish
    end
  end

end
