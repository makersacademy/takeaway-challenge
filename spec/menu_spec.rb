require './lib/menu.rb'
require './lib/restaurant.rb'

describe Menu do

  subject(:menu) { described_class.new }

  context 'default #initialization' do
    it 'can create a menu' do
      expect { Menu.new }.not_to raise_error
    end
    it 'responds to a method for viewing dishes with prices' do
      expect { menu.dishes }.not_to raise_error
    end
  end

  context '#dishes' do
    it 'receives a list of dishes with prices on initialization' do
      expect(menu.dishes).to include({ "Chicken Tikka" => 8.99 })
      expect(menu.dishes).to include({ "Dry Meat" => 10.99 })
      expect(menu.dishes).to include({ "Garlic Naan" => 3.49 })
    end
  end

  context '#display' do
    it 'displays the dishes available for order' do
      expect(menu.display).to include(menu.dishes.to_s)
    end
    it 'displays the dishes in the context of a menu' do
      expect(menu.display).to match "Ty Abs - Whitechapel
Takeaway Menu
#{menu.display_menu}
Please order before 10pm
Delivery is available in the E2 area"
    end
  end

  context '#order_request' do
    it 'responds to an order request' do
      expect { menu.order_request }.not_to raise_error
    end

    it 'asks user for their order' do
      order_intro = 'What would you like to order?'
      expect(menu.order_request).to eq order_intro
    end
  end

  context '#add_to_order' do
    let(:item) { double :item }
    it 'allows user to add an item to their order' do
      menu.add_to_order("Chicken Tikka", 1)
      expect(menu.pending_order).to include "Chicken Tikka"
    end
    it 'adds the item to pending order' do
      number = 1
      message = "#{number} #{item}(s) added to your order."
      expect(menu.add_to_order(item, number)).to eq message
    end
    it 'totals up the pending order' do
      expect { menu.add_to_order("Chicken Tikka", 3) }.to change { menu.total_cost }.by 26.97
    end
  end

  context '#confirm_order' do
    it 'returns an error if the total submitted is not the correct total cost' do
      allow(menu).to receive(:total_cost) { 2 }
      total_submitted = 12
      message = "Your submitted order total of #{total_submitted} is not correct."
      expect { menu.confirm_order(total_submitted) }.to raise_error message
    end
    it 'returns confirmation' do
      allow(menu).to receive(:total_cost) { 10.99 }
      total_submitted = 10.99
      message = "Total cost is 10.99. Thank you for your order."
      expect(menu.confirm_order(total_submitted)).to eq message
    end
  end

  context '#order_placed' do
    it 'marks order as being in progress' do
      menu.order_placed
      expect(menu.order_in_progress).to eq true
    end
  end

end
