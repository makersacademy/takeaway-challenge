require 'restaurant'

describe Restaurant do

  it { is_expected.to respond_to(:menu) } # .with(1).argument

  describe '#initialize' do
    it 'should initialize with a new instance of the Menu class' do
      expect(Restaurant.new.menu).not_to be nil
    end

    it 'should initialize with a new instance of the Order class' do
      expect(Restaurant.new.order).not_to be nil
    end
  end
end
