require 'takeaway'

describe Takeaway do

  describe '#display_menu' do
    it 'displays the menu' do
      expect(subject.display_menu).to eq(Takeaway::MENU)
    end
  end

  describe '#add_dish' do
    it 'adds a dish to the order' do
      subject.add_dish("item")
      expect(subject.order).to eq(["item"])
    end

    it 'adds specified quantity' do
      subject.add_dish("item", 3)
      expect(subject.order.count).to eq(3)
    end
  end

  describe '#total' do
    it 'gives the total cost of order' do
      subject.add_dish("ramen", 2)
      subject.add_dish("sushi")
      expect(subject.total).to eq("Your order of 3 items comes to a total of £26")
    end
  end

  describe '#view_order' do
    it 'shows the current order' do
      subject.add_dish("sashimi")
      expect(subject.view_order).to eq("Your order of 1 items comes to a total of £14")
    end
  end

  describe '#confirm_order' do
    it 'sends a confirmation text' do  
      subject.add_dish("bento")
      expect(subject).to respond_to(:confirm_order)
    end
  end
end
