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
    it 'this is my test' do
      output = place_order_with_input("Broccoli")

      expect(output).to eq "Please type each dish you require followed by return. When you have finished your order press return twice.\n"
    end
  end

  def place_order_with_input(order)
    input = StringIO.new(order)
    output= StringIO.new

    takeaway = Takeaway.new(input: input, output: output)
    expect(takeaway.order).to eq input.string

    output.string
  end

end
