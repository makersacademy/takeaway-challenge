require 'restaurant.rb'

describe Restaurant do
  describe '#show_menu' do
    it 'outputs a hash of dishes and prices' do
      expect(subject.show_menu).to eq ({ "chips" => 1.50, "chicken" => 2.00 })
    end
  end
  describe '#order' do
    # fails if customer order something off menu?
    it 'stores a customer order in a basket' do
      subject.order("chips", 3)
      expect(subject.basket).to include "chips" => 3
    end

    it 'increases the portions in basket when a dish is ordered again' do
      subject.order("chips")
      subject.order("chips")
      expect(subject.basket).to include "chips" => 2
    end
  end

  describe '#basket_summary' do
    it 'outputs subtotals for each of the dishes ordered' do
      subject.order("chips", 5)
      subject.order("chicken", 5)
      expect(subject.basket_summary).to eq "5 portions of chips @ £1.50 each = £7.50, 5 portions of chicken @ £2.00 each = £10.00"
    end
    describe '#total' do
      it 'outputs the total amount owing' do
        subject.order("chips", 5)
        subject.order("chicken", 5)
        expect(subject.total).to eq "Total owing: £17.50"
      end
    end
  end
end
