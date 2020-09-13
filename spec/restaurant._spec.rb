require 'restaurant'

bubba_shrimp = Restaurant.new

describe Restaurant do
  describe '#new_order' do
    it 'creates a new order' do
      expect(bubba_shrimp.new_order).to be_an(Order)
    end
  end

  describe '#place_order' do
    it 'checks the total' do
      expect { bubba_shrimp.place_order(5.99) }.to raise_error "The total is incorrect"
    end
    it 'confirms the total is correct' do
      allow(bubba_shrimp.order).to receive(:sum) { 5.99 }
      expect { bubba_shrimp.place_order(5.99) }.not_to raise_error
    end
  end

  describe "send text" do
    time = (Time.now+(60*60)).strftime("%H:%M")
    it 'sends a text back to the user' do
      expect { bubba_shrimp.send_text } .to output("Thank you! Your order was placed and will be delivered before #{time}.\n").to_stdout
    end
  end
    
end

