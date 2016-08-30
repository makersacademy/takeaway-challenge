require 'takeaway_menu'

describe TakeawayMenu do

  subject { described_class.new }

  it "has a defualt #{TakeawayMenu::DEFAULT_CUISINE} menu" do
    expect(subject.menu).to eq TakeawayMenu::DEFAULT_MENU
  end

  it "Shows the menu" do
    expect(subject.show_menu).to eq TakeawayMenu::DEFAULT_MENU
  end

  it 'retuns a dish price' do
    expect(subject.dish_price("pasta")).to eq 3
  end

  context '#includes_dish?' do
    it 'returns true if a dish is from the menu' do
      expect(subject.from_the_menu?("pasta")).to eq true
    end
    it 'returns false if a dish is not from the menu' do
      expect(subject.from_the_menu?("banana")).to eq false
    end

  end



end
