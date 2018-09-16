require "menu.rb"

describe Menu do
  let(:dish) { double(:dish) }
  let(:fish_dish) { double(:fish_dish) }
  before(:each){
    allow(dish).to receive(:name).and_return("chicken")
    allow(dish).to receive(:price).and_return(2)
    allow(dish).to receive(:available).and_return(true)

    allow(fish_dish).to receive(:name).and_return("fish")
    allow(fish_dish).to receive(:price).and_return(4)
    allow(fish_dish).to receive(:available).and_return(true)
  }
  describe '#add_dish' do
    it 'adds a dish to the dishes array' do
      subject.add_dish(dish)
      expect(subject.dishes).to include dish
    end
  end
  # describe '#show_menu' do
  #   it 'shows the menu with all dishes and their associated prices' do
  #     subject.add_dish(dish)
  #     subject.add_dish(fish_dish)
  #     expect(subject.show_menu).to eql([
  #       {chicken: 2},
  #       {fish: 4}])
  #   end
  # end

  describe '#remove_dish' do
    it 'removes a dish from the dishes array' do
      subject.add_dish(dish)
      subject.add_dish(fish_dish)
      subject.remove_dish(fish_dish)
      expect(subject.dishes).not_to include fish_dish
    end
  end
end
