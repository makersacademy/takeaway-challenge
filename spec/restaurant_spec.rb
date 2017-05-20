require 'restaurant'

describe Restaurant do

  it { is_expected.to respond_to(:menu) } # .with(1).argument

  describe '#initialize' do
    it 'should initialize with a new instance of the Menu class' do
      expect(Restaurant.new.menu).not_to be nil
    end
  end

  describe '#show_menu' do
    let(:menu) { double :menu, dishes: [{"edemame"=>3}] }
    it 'should show a (currently empty) list of dishes' do
      expect(subject.show_menu).to eq []
    end

    it 'should show a food type and its price' do
      expect(subject.show_menu).to eq [{"edemame"=>3}]
    end
  end

end
