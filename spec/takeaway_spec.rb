require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }

  before do
    allow(takeaway).to receive(:send_text)
  end

  context 'full menu displayed' do
    it 'prints menu with prices' do
      takeaway = Takeaway.new
      takeaway.read_menu
      expect(takeaway.read_menu.length).to eq(5)
    end
  end
  
  context 'creating an order' do
    it 'adds to order' do
      takeaway = Takeaway.new
      takeaway.add_order('pizza', 1)
      expect(takeaway.add_order('pizza', 1)).to eq "You added 1x pizza to your basket"
    end

    it 'removes from order' do
      takeaway = Takeaway.new
      takeaway.remove_order('pizza',1)
      expect(takeaway.remove_order('pizza', 1)).to eq "You removed 1x pizza from your basket"
    end
  end

  context 'viewing order' do
    it 'outputs basket to console' do
      takeaway.add_order('pizza')
      takeaway.basket_summary
      expect { takeaway.basket_summary }.to output(
        "pizza 1x = £12.99\n"
      ).to_stdout
    end
  end

  context 'complete order' do
    it 'sends a payment confirmation text message' do
      expect(takeaway).to receive(:send_text)
      takeaway.complete_order
    end
  end
end
