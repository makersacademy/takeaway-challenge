require 'takeaway'

describe TakeAway do

  subject(:takeaway) {described_class.new Menu}

  context 'Customer' do
    it 'can see the menu' do
      expect(takeaway.menu_list).not_to be_empty
    end
    it 'can\'t order a dish not in the menu' do
      expect{takeaway.add_item :pomodoro, 2}.to raise_error 'not in the menu'
    end
    it 'can order a dish in the menu' do
      expect{takeaway.add_item :pizza,2}.to change{takeaway.order.length}.by 1
    end
    it 'can\'t delete a dish not in the ordered dishes' do
      expect{takeaway.add_item :pomodoro, 2}.to raise_error'not in the menu'
    end
    it 'can delete an item ordered' do
      takeaway.add_item :pizza, 2
      expect{takeaway.delete :pizza,1 }.to change{takeaway.order[:pizza]}.by(-1)
    end
  end

  context 'bill' do
    it 'has a order summary' do
      takeaway.add_item :pizza, 2
      expect(takeaway.order_summary).to eq 'Your order: pizza x 2 = £20'
    end
    it 'is:' do
      takeaway.add_item :pizza, 2
      expect(takeaway.total).to eq 'Your bill is: £20'
    end
    it 'confirm the order' do
      takeaway.add_item :pizza, 2
      response = "thank you for your order, You will" <<
                 " receive a confirmation message soon"
      expect(takeaway.confirmation('yes')).to eq response
    end
  end

end
