require 'order'

describe Order do

  it { is_expected.to be_a Order }

  describe '#print_menu' do
    it' is expected to print the menu items' do
      expect(subject.print_menu).to be_a Hash
    end
  end

  describe '#select(selection, number)' do
    it { is_expected.to respond_to(:select).with(2).arguments }

    it 'raises an error if the item is not on the menu' do
      expect { subject.select("TV", 1) }.to raise_error 'TV is not on the menu'
    end

    it 'adds selection to selections if item on menu' do
      subject.select("Miso Soup", 2)
      expect(subject.selections).to eq ["Miso Soup", "Miso Soup"]
    end

    it 'prints total cost so far after each select' do
      expect { subject.select("Teriyake Donburi", 1) }.to output("The total cost of your order is now £10.25\n").to_stdout
    end
  end

  describe '#remove(selection)' do
    it 'raises an error if item not previously selected' do
      expect { subject.remove("Steamed Rice") }.to raise_error 'Steamed Rice was not previously selected'
    end

    it 'removes item from selection if previously selected' do
      subject.select("Katsu Curry", 1)
      subject.remove("Katsu Curry")
      expect(subject.selections).to eq []
    end

    it 'subtracts the price of the meal from total cost' do
      subject.select("Steak Bulgogi", 2)
      subject.remove("Steak Bulgogi")
      expect(subject.cost).to eq 14.5
    end
  end

  describe '#view_selections' do
    it 'raises an error if not selected any items' do
      expect { subject.view_selections }.to raise_error 'No items have been selected'
    end

    it 'shows selections if one or more item selected' do
      subject.select("Steamed Rice", 2)
      subject.select("Chicken Ramen", 1)
      expect(subject.view_selections).to eq(["Steamed Rice", "Steamed Rice", "Chicken Ramen"])
    end
  end

  describe '#confirm' do
    it 'shows confirmation message once order is confirmed' do
      expect { subject.confirm }.to output("Thank you for your order, your food will arrive at #{Time.now.hour}:#{Time.now.min + 30}\n").to_stdout
    end
  end
end
