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
    it 'can ask for one order from menu and return summary and total' do
      output = place_order_with_input_and_return_output("Broccoli")
      
      expect(output).to eq <<~OUTPUT
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        how many do you want?
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        0 order of Broccoli at £1 each
        Total order is £1
        OUTPUT
    end
    it 'can ask for three orders from menu and return summary and total' do
      output = place_order_with_input_and_return_output("Broccoli", 2, "Chips", 1, "Ice_cream", 1)
      
      expect(output).to eq <<~OUTPUT
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        how many do you want?
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        how many do you want?
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        how many do you want?
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        2 order of Broccoli at £1 each
        1 order of Chips at £1 each
        1 order of Ice_cream at £1 each
        Total order is £3
        OUTPUT
    end
    it 'stores an order of one dish' do
      takeaway = place_order_with_input_and_return_class("Chips", 1)
      expect(takeaway.summary).to eq([{ food: "Chips", quantity: 1 }])
    end
    it 'stores an order of four dishes' do
      takeaway = place_order_with_input_and_return_class("Chips", 1, "Broccoli", 3, "Tofu", 1, "Ice_cream", 4)
      expect(takeaway.summary).to eq([{ food: "Chips", quantity: 1 }, 
        { food: "Broccoli", quantity: 3 }, { food: "Tofu", quantity: 1 }, 
        { food: "Ice_cream", quantity: 4 }])
    end
  end

  context '#confirm order' do
    it 'confirms order' do
      output = StringIO.new
      takeaway = Takeaway.new(output: output)
      takeaway.confirm_order
      expect(output.string).to eq "Total order is £0\n"
    end
  end

  def place_order_with_input_and_return_output(*order)
    input = StringIO.new(order.join("\n") + "\n" + "\n" + "\n")
    output = StringIO.new
    test_price = 1

    takeaway = Takeaway.new(input: input, output: output)
    allow(takeaway.menu).to receive(:check).and_return(true)
    allow(takeaway.menu).to receive(:price).and_return(test_price)
    takeaway.order

    output.string
  end

  def place_order_with_input_and_return_class(*order)
    input = StringIO.new(order.join("\n") + "\n" + "\n" + "\n")
    output = StringIO.new
    test_price = 1

    takeaway = Takeaway.new(input: input, output: output)
    allow(takeaway.menu).to receive(:check).and_return(true)
    allow(takeaway.menu).to receive(:price).and_return(test_price)

    takeaway.order

    takeaway
  end

end
