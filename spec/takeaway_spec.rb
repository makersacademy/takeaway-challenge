require 'takeaway'

describe Takeaway do

  let(:takeaway)       { described_class.new                     }
  let(:menu_class)     { double('menu_class', new: menu)         }
  let(:menu)           { double('menu')                          }
  let(:food_selection) { double('food_selection', empty?: false) }

  describe '#print_menu' do
    it 'prints a menu' do
      expect { takeaway.print_menu }.to output.to_stdout
    end
  end

  describe '#take_order' do

    # it 'saves user order to order instance variable' do
    #   # allow(takeaway).to receive(:gets).and_return('pad thai', '2', '')
    #   # takeaway.take_order
    #   # expect(takeaway.order).to eq(['pad thai', 'pad thai'])
    # end

    # it 'raises an error if the order is not part of the menu' do
    #   allow(takeaway).to receive(:gets).and_return('pizza', '')
    #   error = "We don't have that here, try something else."
    #   expect { takeaway.take_order }.to raise_error(error)
    # end
  end

  # describe '#verify_current_order' do
  #   it 'shows the current order with total cost' do
  #     allow(takeaway).to receive(:gets).and_return('pad thai', '2', '')
  #     takeaway.take_order
  #     order_verification = "You ordered:\n2 x pad thai(s)\nTotal cost: £13.9\n"
  #     expect { takeaway.verify_current_order }.to output(order_verification).to_stdout
  #   end
  # end
end
