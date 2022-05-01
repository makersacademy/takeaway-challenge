require 'takeaway'
require 'stringio'

describe Takeaway do
  
  context '#show menu' do
    it 'should call #show from class instance of Menu' do
      expect(subject.menu).to receive(:show)
      subject.show_menu
    end
  end

  context '#order' do
    it 'can order one item from menu' do
      output = place_order_with_input("Broccoli", 1)

      expect(output).to eq <<~OUTPUT
        Please type each dish you require followed by return. When you have finished your order press return twice.
        how many do you want?
        OUTPUT
      end
  end

  def place_order_with_input(*order)
    input = StringIO.new(order.join("\n") + "\n")
    output= StringIO.new

    takeaway = Takeaway.new(input: input, output: output)
    expect(takeaway.order).to eq true

    output.string
  end

end
