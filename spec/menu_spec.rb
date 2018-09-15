require "menu.rb"

describe Menu do
  it { is_expected.to respond_to :dishes }
  let(:dish) { double(:dish) }
  before(:each){
    allow(dish).to receive(:name).and_return("chicken")
    allow(dish).to receive(:price).and_return(2)
    allow(dish).to receive(:available).and_return(true)
  }
  describe '#add_dish' do
    it 'adds a dish to the dishes with prices array' do
      subject.add_dish(dish)
      expect(subject.dishes).to include dish
    end
    it 'raises error if dish is not available' do
      allow(dish).to receive(:available).and_return(false)
      expect {subject.add_dish(dish)}.to raise_error "Dish is not currently available"
    end
  end
  describe '#show_menu' do
    it 'shows the menu with all dishes and their associated prices' do
      subject.add_dish(dish)
      expect(subject.show_menu).to eql([{
        chicken: 2} ])
    end
  end
end
