require_relative '../lib/takeaway.rb'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:dish) { double(:dish) }
  

  context 'Display menu' do
    it 'should display the menu' do
      expect(subject).to respond_to(:view_menu)
    end

    it 'should list all the items in the menu' do
      expect(subject.view_menu).to eq 'Chicken £3.78 | Pasta £4.59 | Salad £2.86'
    end
  end
  context 'Creation of order' do
    it 'should allow the creation of a new order' do
      expect(subject.create_order(:dish, 5)).to eq [{ dish: 5 }]
    end

    it 'should check if order is not empty' do
      expect { subject.view_order }.to raise_error 'You have not ordered anything yet!'
    end

    it 'should allow adding more dishes in the order' do
      takeaway.create_order(:dish, 5)
      expect { subject.add_more_dishes(:dish, 5) }.to change { subject.view_order.length }.by 1
    end
  end

  context 'Order Checking' do
    it 'should allow user to check what has been ordered and total cost' do
      takeaway.create_order(:dish, 5)
      takeaway.add_more_dishes(:dish, 5)
      expect { takeaway.print_current_order }.to output("\"dish - 5\"\n\"dish - 5\"\n\"Total = 10\"\n").to_stdout
    end

    it 'should raise error if order is empty' do
      expect { subject.print_current_order }.to raise_error 'You have not ordered anything yet!'
    end

    # context "Inform Customer of his delivery" do
    #   it "should send a delivery notification to the customer once order complete"
    #   expect(takeaway.complete_order).to eq
    # end
  end
end
