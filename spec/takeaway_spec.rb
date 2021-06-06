require 'takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new }
  let(:menu) { { "Spring roll" => 0.99, "Char sui bun" => 3.99, 
  "Pork dumpling" => 2.99, "Peking duck" => 7.99, 
  "Fu-king fried rice" => 5.99 } }

  context '#read_menu' do 
    it 'Displays the menu' do 
      subject.read_menu
      expect(subject.read_menu).to eq menu
    end
  end

  context '#order' do 
    it 'Returns order' do
      allow($stdin).to receive(:gets).and_return('Spring roll')
      expect(subject.order).to eq('item added to the basket.')
    end
  end

  context '#basket_summary' do 
    it 'The contents of the basket, including price' do
      items = 
      subject.basket_summary
      expect(subject.basket_summary).to eq items
    end
  end

  context '#total' do
    it 'Total value of the order displayed' do
      subject.total
      expect(subject.total).to eq "Your meal total comes to £0"
    end
  end

  context '#checkout' do 
    it 'Returns order confirmation text' do
      subject.checkout
      expect(subject.checkout).to eq "Thanks for your order. Your food will arrive in roughly 1 hour."
    end
  end
end
