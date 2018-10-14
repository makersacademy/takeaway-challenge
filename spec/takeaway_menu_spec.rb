require 'takeaway_menu'

describe TakeawayMenu do

  let(:dish1) { double :dish1, name: 'Classic Burger', price: 5 }
  let(:dish2) { double :dish2, name: 'Steak', price: 10 }
  let(:dish3) { double :dish3, name: 'Milkshake', price: 3 }

  describe '#view_menu' do
    before { subject.add(dish1); subject.add(dish2); subject.add(dish3) }
  end
end
