require 'takeaway'

describe Takeaway do

  let(:dish1) { 'wonton' }
  let(:dish1_price) { 3.46 }
  let(:dish2) { 'seaweed' }
  let(:dish2_price) { 3.57 }
  let(:message_service) { double('message_service',send_sms: nil) }
  let(:menu) { double('menu',print: nil,items: { dish1 => dish1_price, dish2 => dish2_price }) }
 

  subject(:takeaway) { described_class.new(menu, message_service) }

  describe '#print_menu' do

    xit 'prints the menu' do
      expect(takeaway.menu).to receive :print
      takeaway.print_menu
    end

  end

  describe '#order_summary' do

    it 'is empty by default' do
      expect(takeaway.order_summary).to be_empty
    end
    it 'shows what is currently in the basket' do
      takeaway.order  dish1
      expect(takeaway.order_summary).to eq "1 #{dish1} = #{dish1_price}"
    end

  end

  describe '#order_total' do

    it 'has an order total of 0 by default' do
      expect(takeaway.order_total).to eq "Total = £0"
    end
    it 'shows the total cost of all items in the basket' do
      takeaway.order  dish1
      takeaway.order  dish2
      expect(takeaway.order_total).to eq "Total = £#{dish1_price+dish2_price}"
    end

  end

  describe '#order' do

    xit 'adds an item to the basket' do
      takeaway.order  dish1
      expect(takeaway.basket).to include ([1, dish1, dish1_price])
    end
    it 'adds the cost of the item to the total' do
      takeaway.order  dish1
      expect(takeaway.order_total).to eq "Total = £#{dish1_price}"
    end
    xit 'allows a quantity to be specified' do
      takeaway.order( dish1, 2)
      expect(takeaway.basket.count).to eq 2
    end
    xit 'adds more than one item to the basket' do
      takeaway.order  dish1
      takeaway.order  dish2
      expect(takeaway.basket.count).to eq 2
    end
    it "will raise error if item isn't on the menu" do
      expect{ takeaway.order 'fish sauce' }.to raise_error 'item is not on the menu'
    end
    it 'confirms that the items have been added to the basket' do
      expect(takeaway.order  dish1).to eq "1 #{dish1} added to basket"
    end

  end

  describe '#checkout' do

    it "raises an error if the wrong payment is received" do
      takeaway.order  dish1
      expect{ takeaway.checkout_order(dish1_price + 1) }.to raise_error 'please pay the correct amount'
    end
    it "empties the basket" do
      takeaway.order  dish1
      takeaway.checkout_order(dish1_price)
      expect(takeaway.order_summary).to be_empty
    end
    it "sets the total back to 0" do
      takeaway.order  dish1
      takeaway.checkout_order(dish1_price)
      expect(takeaway.order_total).to eq "Total = £0"
    end
    it 'sends an sms confirmation to the user' do
      takeaway.order  dish1
      expect(takeaway).to receive (:send_confirmation)
      takeaway.checkout_order(dish1_price)
    end
  end

end
