require 'menu'

describe Menu do

  subject { described_class.new }

  it "Shows the menu" do
    expect(subject.display_menu).to eq Menu::PIZZA_MENU
  end

  it 'retuns a dish price' do
    expect(subject.price("margherita")).to eq 8
  end

  context '#includes_dish?' do
    it 'returns true if a dish is from the menu' do
      expect(subject.dish_avaliable?("margherita")).to eq true
    end
    it 'returns false if a dish is not from the menu' do
      expect(subject.dish_avaliable?("coffee")).to eq false
    end
  end
end
