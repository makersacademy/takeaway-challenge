require 'takeaway'
require 'menu'

describe Takeaway do
  let(:takeaway)  { described_class.new }
    let(:menu)  { described_class.new }

    before(:each) do
      subject.add_dish("Dish1", 5)
      subject.add_dish("Dish2", 2)
      subject.add_dish("Dish3", 4)
    end

  describe '#show_menu' do
    it { is_expected.to respond_to(:show_menu) }
    it 'should return items in the menu' do
      expect(subject.show_menu).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#add_dish' do
    it { is_expected.to respond_to(:add_dish).with(2).arguments }
    it 'should add a dish to the menu array' do
      expect(subject.show_menu).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#add_to_order' do
    it { is_expected.to respond_to(:add_to_order).with(1).arguments }
    it 'should add a number of dishes ordered to order_array' do
      expect(subject.add_to_order("1,3")).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#basket' do
    it { is_expected.to respond_to(:basket) }
    it 'should show the items in the basket from the ordered array' do
      subject.add_to_order("1, 3")
      expect(subject.basket).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
    end
  end
  describe '#total_basket' do
      it { is_expected.to respond_to(:total_basket) }
      it 'should add up the total price of dishes ordered' do
        takeaway.add_dish("Dish1", 5)
        takeaway.add_dish("Dish2", 2)
        takeaway.add_dish("Dish3", 4)
        takeaway.add_to_order("1,3")
        expect(takeaway.total_basket).to eq ("Your total - £9")
    end
  end
  describe "#checkout" do
    it { is_expected.to respond_to(:checkout) }
    it 'should output the correct values for ordered' do
      takeaway.add_dish("Dish1", 5)
      takeaway.add_dish("Dish2", 2)
      takeaway.add_dish("Dish3", 4)
      takeaway.add_to_order("1,3")
      expect(takeaway.checkout).to eq ([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
    end
  end
end
