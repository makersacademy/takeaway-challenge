require 'basket'

describe Basket do
  # let(:menu) { double :menu }#, new: ({ pizza: 4, burger: 3, hot_dog: 2 })) }
  # :menu.new({ pizza: 4, burger: 3, hot_dog: 2 })
  # allow(:menu).to receive(:new).with({ pizza: 4, burger: 3, hot_dog: 2 })
  let(:menu) { Menu.new({ pizza: 4, burger: 3, hot_dog: 2 }) }

  let(:subject) { Basket.new(menu) }

  describe "#add" do
    before(:each) do
      subject.add("pizza")
    end

    it 'raises an error if dish not on menu, and does not add to basket' do
      expect { subject.add("falafel") }.to raise_error("Sorry, falafel is not on the menu.")
      expect(subject.dishes).not_to include("falafel")
    end

    it 'adds multiple quantities of a dish' do
      subject.add("burger", 3)
      expect(subject.dishes).to eq %w(pizza burger burger burger)
    end

    it 'adds the dish to the list of dishes' do
      expect(subject.dishes).to eq ["pizza"]
    end
  end

  describe "#remove" do
    before(:each) do
      %w(pizza hot_dog pizza).each { |dish| subject.add(dish) }
    end
    
    it 'allows a dish to be removed from the order' do
      subject.remove("pizza")
      expect(subject.dishes).to eq %w(hot_dog pizza)
    end

    it 'removes the dish multiple times with a second argument' do
      # code correctly ignores any dishes not on the menu
      # or if quantity argument > how many items already in basket
      subject.remove("pizza", 3)
      expect(subject.dishes).to eq ["hot_dog"]
    end
  end

  context "aggregating" do
    before(:each) do
      subject.add(:burger, 2)
      subject.add(:pizza, 3)
    end

    describe "#total" do
      it 'shows the total cost' do
        expect(subject.total).to eq 18
      end
    end

    describe "#summary" do
      it 'summarizes the basket contents' do
        expect(subject.summary).to eq "Burger x 2: £6\nPizza x 3: £12\nTotal: £18\n"
      end
    end
  end
end
