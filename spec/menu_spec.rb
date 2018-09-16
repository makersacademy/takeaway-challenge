require 'menu'
require 'dish'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish }
  
  # it { is_expected.to respond_to(:dishes) }
  it { is_expected.to respond_to(:add_dish).with(1).arguments }
  it { is_expected.to respond_to(:display) }
  it { is_expected.to respond_to(:dish?).with(1).arguments }
  it { is_expected.to respond_to(:get_dish_obj).with(1).arguments }

  describe '#display' do
    it 'display dishes in menu' do
      expect(subject.display).to eq([])
    end
  end 
  
  describe '#add_dish' do
    it 'adds new dish to menu' do
      # allow(dish).to receive(:is_a?).with(Dish).and_return(true)
      subject.add_dish(dish)
      expect(subject.dishes).to include(dish)
    end
  end

  describe '#has_dish?' do
    it 'returns true if dish is available' do
      allow(dish).to receive(:name).and_return("dish_name")
      subject.add_dish(dish)
      expect(subject.dish?("dish_name")).to be_truthy
    end

    it 'returns false if dish is not availble' do
      allow(dish).to receive(:name).and_return("dish_name")
      subject.add_dish(dish)
      expect(subject.dish?("dish_name_1")).to be_falsy
    end
  end
 
  describe '#get_dish_obj' do
    it 'returns dish object' do
      dish_name = double 'dish_name'
      allow(dish).to receive(:name).and_return(dish_name)
      subject.add_dish(dish)
      expect(menu.get_dish_obj(dish_name)).to eq(dish)
    end
  end
end
