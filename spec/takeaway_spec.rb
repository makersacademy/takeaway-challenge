require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu, to_s: "menu", dish_info: ["dish", 10.00] }
  let(:order) { double :order, to_s: "order", add: nil, remove: nil }
  let(:message) { double :message, confirm: nil }
  let(:takeaway) { described_class.new(menu: menu, message: message, order: order) }
  

  describe '#menu' do
    it 'shows the customer a menu' do
      expect { takeaway.menu }.to output("menu\n").to_stdout
    end
  end

  describe '#order' do
    it 'adds the items to the order instance' do
      takeaway.order(dish: 3, x: 4)
      expect(order).to have_received(:add).with("dish", 10.00, 4)
    end

    it 'gets menu to provide dish info' do
      takeaway.order(dish: 3, x: 4)
      expect(menu).to have_received(:dish_info).with(2)
    end

    it 'confirms items are added to the order' do
      expect(takeaway.order(dish: 3, x: 4)).to eq("4 x dish - added to your order :)")
    end  
  end

  describe '#unorder' do
    it 'removes the items to the order instance' do
      takeaway.unorder(dish: 1, x: 2)
      expect(order).to have_received(:remove).with("dish", 2)
    end

    it 'gets menu to provide dish info' do
      takeaway.unorder(dish: 1, x: 2)
      expect(menu).to have_received(:dish_info).with(0)
    end

    it 'confirms items are added to the order' do
      expect(takeaway.unorder(dish: 1, x: 2)).to eq("2 x dish - removed from your order :)")
    end  
  end

  describe '#basket' do
    it 'displays the current order' do
      expect { takeaway.basket }.to output("order\n").to_stdout
    end  
  end

  describe '#checkout' do
    it 'sends phone number and delivery time to message' do
      takeaway.checkout('5551342')
      expect(message).to have_received(:confirm).with('5551342', (Time.now + (60 * 60)).strftime("%H:%M"))
    end
  end
end
