require 'restaurant'

describe Restaurant do

  it { is_expected.to respond_to(:menu) } # .with(1).argument

  describe '#initialize' do
    it 'should initialize with a new instance of the Menu class' do
      expect(Restaurant.new.menu).not_to be nil
    end
  end

  describe '#show_menu' do
    it 'should show a (currently empty) list of dishes' do
      expect(subject.show_menu).to eq []
    end
  end

end
