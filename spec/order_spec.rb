require_relative '../lib/order'

describe Order do
  
  describe '#view_menu' do
    it 'should display the menu from the takeaway' do
      takeaway_double = double(:takeaway, :display_menu => { "Dish 1" => 10, "Dish 2" => 12 })
      subject.view_menu(takeaway_double)
      expect(subject).to respond_to(:view_menu).with(1).argument
      expect(takeaway_double).to have_received(:display_menu)
    end
  end

  describe '#add_dish' do
    it 'should accept a takeaway, dish and quantity' do
      takeaway_double = double(:takeaway)
      allow(takeaway_double).to receive(:menu).and_return({ "Dish 1": 10 })
      subject.add_dish(takeaway_double, "Dish 1", 1)
      expect(subject).to respond_to(:add_dish).with(3).argument
    end
  end

  describe '#check total' do
    it 'should check the total cost of the order' do
      takeaway_double = double(:takeaway)
      allow(takeaway_double).to receive(:menu).and_return({ "Dish 1": 10 })
      subject.add_dish(takeaway_double, "Dish 1", 1)
      subject.add_dish(takeaway_double, "Dish 1", 1)
      expect(subject.total).to eq(20)
    end
  end

  describe '#verify_order' do
    it 'should check the cost of items added to order and compare this to the order total' do
      takeaway_double = double(:takeaway)
      # allow(takeaway_double).to receive(:menu).and_return({"Dish 1": 10})
      expect(subject.verify_order(takeaway_double)).to eq(subject.total)
    end
  end 
  
  describe '#place_order' do
    it 'should pass the order to the takeaway' do
      subject.place_order
      expect(subject).to respond_to(:place_order)
    end

    it 'should clear the order contents' do
      subject.place_order
      expect(subject.dishes).to be_empty
    end
  end
end
