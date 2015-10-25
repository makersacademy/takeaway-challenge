require 'takeaway'

describe TakeAway do

  subject(:takeaway) {described_class.new()}
  # let(:menu) { double(menu:, :pizza => 10 }

  context 'Customer' do
    it 'can see the menu' do
      expect(takeaway).to respond_to :order
        end

    it 'can\'t order a dish not in the menu' do
      # allow(menu).to receive(:dishes){ pasta, 10 }
      takeaway()
      expect{takeaway.add_meal(:pomodoro, 2)}.to raise_error 'dish not in the menu'
    end
    it 'can order a dish in the menu' do

      expect{takeaway.add_meal(:pizza, 2)}.to change {takeaway.order.length}.by(1)
    end
    it 'can\'t delete a dish not in the ordered dishes' do
      # allow(menu).to receive(:dishes){ pasta, 10 }
      takeaway()
      expect{takeaway.add_meal(:pomodoro, 2)}.to raise_error 'dish not in the menu'
    end
    it 'can delete an item ordered' do
      takeaway
      takeaway.add_meal(:pizza, 2)
      expect{takeaway.delete(:pizza, 1)}.to change{takeaway.order[:pizza]}.by(-1)
    end
  end

  context 'bill' do
    it 'has a order summary' do
      takeaway.add_meal(:pizza, 2)
      expect(takeaway.order_summary).to eq 'Your order: pizza x 2 = £20'
    end
    it 'is:' do
      takeaway.add_meal(:pizza, 2)
      expect(takeaway.total).to eq 'Your bill is: £20'
    end
  end

end
