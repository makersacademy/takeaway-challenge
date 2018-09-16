require 'takeaway'

describe Takeaway do
  let(:working_order) { double(:order) }
  let(:failing_order) { double(:order) }
  let(:number) { double(:customer_phone_number) }

  describe '#show menu' do
    it 'prints the menu to the screen' do
      expect { subject.show_menu }.to output.to_stdout
    end
  end

  describe '#order' do
    xit 'takes a list and orders it' do
      allow(working_order).to receive(:each)
      allow(working_order).to receive(:[]).with(:total).and_return(0)
      expect { subject.order(working_order, number) }.not_to raise_error
    end
    
    it 'raises an error if given total is incorrect' do
      allow(failing_order).to receive(:each)
      allow(failing_order).to receive(:[]).with(:total).and_return(1)
      expect { subject.order(failing_order, number) }.to raise_error 'Incorrect total'
    end
  end
end
