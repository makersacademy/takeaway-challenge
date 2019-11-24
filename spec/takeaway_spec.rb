require 'takeaway'
require 'menu'

describe Takeaway do
  
  let(:menu) { double :menu, { "sausage" => 4 } }
  subject(:takeaway) { described_class.new(menu) }
  items = { sausage: 6, pie: 2 }

  context 'order'

  describe '#view_menu' do  
    it 'should display the menu' do
      expect(subject.view_menu).to eq(:menu.display)
    end  
  end
  
  describe '#select_dish' do
    it 'should add a dish to the basket' do
      subject.select_dish(:pie, 2)
      expect(subject.basket).to include({ pie: 2 })
    end
  end

  describe '#total' do
    #how can I assign { "sausage" => 4 } to the menu double?
    it 'should calculate the total of the order' do
      subject.select_dish(:sausage, 6)
      expect(subject.total).to eq "Total is £24"
    end
  end

  describe "#place_order" do
    it 'should raise an error if the amount is incorrect' do
      subject.select_dish(:sausage, 6)
      expect{ subject.place_order(3) }.to raise_error("Incorrect total")
    end

    it 'should send a confirmation text' do
      allow(takeaway).to receive(:send_text)
      expect(takeaway).to receive(:send_text).with("Thank you for your order: £15")
      takeaway.place_order(15)
    end
  end 


end
