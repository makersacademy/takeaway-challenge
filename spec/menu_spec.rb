require 'menu'

describe Menu do
  describe '#initialize' do
    it "initializes with an empty basket" do
      expect(subject.basket).to be_empty
    end
  end

  describe '#print_menu' do
    it "prints a list of options and prices" do
      expect(subject.print_menu).to eq(Menu::MENU_LIST)
    end
  end

  describe "#select_dish" do
    it { is_expected.to respond_to(:select_dish).with(2).arguments }
    it "adds a dish to the basket" do
      subject.select_dish(2, 1)
      expect(subject.basket).to eq [{ "2. Ham and Pineapple" => 9 }]
    end
    it "notifies user the quantity of items that have been added" do
      added_message = "You have added 2 of the #{Menu::MENU_LIST[0]} pizzas to your basket"
      expect(subject.select_dish(1, 2)).to eq added_message
    end
    it "adds 3 dishes to the basket" do
      subject.select_dish(2, 3)
      expect(subject.basket).to eq [{ "2. Ham and Pineapple" => 9 }, { "2. Ham and Pineapple" => 9 }, { "2. Ham and Pineapple" => 9 }]
    end
  end
end
