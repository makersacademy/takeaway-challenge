require 'menu'

describe Menu do
  let(:dish) {double :chicken_chow_mein, name: 'Chicken Chow Mein', price: '£5.95'}
  it { is_expected.to respond_to :dishes }

  describe '#add_dish' do
    it 'should add dish to menu' do
      subject.add_dish :dish
      expect(subject.dishes).to eql [:chicken_chow_mein]
    end
  end

  describe '#show' do
    it 'should show the entire menu' do
      subject.add_dish :dish
      expect(subject.show).to eql 'Menu: Chicken Chow Mein: £5.95'
    end
  end
end
