require 'menu'

describe Menu do

  let(:dish){double(:dish)}

  describe '#add' do
    it 'adds a new dish to the menu' do
      subject.add(dish)
      expect(subject.dishes_available.include?(dish)).to be true
    end
  end

end
