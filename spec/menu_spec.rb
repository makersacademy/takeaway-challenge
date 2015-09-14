require 'menu'

describe Menu do
  let(:dish) {double :dish, show_details: 'Coke: £1'}

  it { is_expected.to respond_to :dishes }

  describe '#add_dish' do

    it { is_expected.to respond_to :add_dish }

    it 'should add dish to menu' do
      subject.add_dish(dish)
      expect(subject.dishes).to eql [dish]
    end
  end

  describe '#show' do

    it { is_expected.to respond_to :add_dish }

    it 'should show the entire menu' do
      subject.add_dish(dish)
      expect(subject.show).to eql "Menu:\nCoke: £1"
    end
  end
end
