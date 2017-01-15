require 'order'
require 'takeaway'

describe Order do
    let(:takeaway)  { described_class.new }
    let(:menu)  { described_class.new }
    let(:order) { described_class.new }

    describe '#add' do
      it { is_expected.to respond_to(:add).with(2).arguments }
      it 'should add a number of dishes ordered to order_array' do
        allow(takeaway).to receive(:show_menu) { [{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}] }
        expect(subject.add("1,3", takeaway.show_menu)).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
      end
    end

    describe '#basket' do
      it { is_expected.to respond_to(:basket) }
      it 'should show the items in the basket from the ordered array' do
        allow(takeaway).to receive(:show_menu) { [{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}] }
        subject.add("1, 3", takeaway.show_menu)
        expect(subject.basket).to eq([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
      end
    end

    describe '#total' do
        it { is_expected.to respond_to(:total) }
        it 'should add up the total price of dishes ordered' do
            allow(takeaway).to receive(:show_menu) { [{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}] }
            allow(takeaway).to receive(:total_order) { "Your total - £9" }
            subject.add("1, 3", takeaway.show_menu)
            expect(takeaway.total_order).to eq ("Your total - £9")
        end
    end

    describe "#checkout" do
      it { is_expected.to respond_to(:checkout) }
      it 'should output the correct values for ordered' do
        allow(takeaway).to receive(:show_menu) { [{:name => "Dish1", :price => 5}, {:name => "Dish2", :price => 2}, {:name => "Dish3", :price => 4}] }
        allow(takeaway).to receive(:order_checkout) { [{:name=>"Dish1", :price=>5}, {:name=>"Dish3", :price=>4}] }
        subject.add("1, 3", takeaway.show_menu)
        expect(takeaway.order_checkout).to eq ([{:name => "Dish1", :price => 5}, {:name => "Dish3", :price => 4}])
      end
    end
end
