require 'takeaway'

describe 'Featuretest' do
  context '#order' do
    it 'will ask again if item mispelt' do
      output = place_order_with_input("Brocoli", "Broccoli")
      
      expect(output).to eq <<~OUTPUT
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        Sorry, we don't have that dish - perhaps you've made a spelling mistake?
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        how many do you want?
        Please type each dish you require followed by return. 
        When you have finished your order press return twice.
        0 order of Broccoli at £1 each
        Total order is £1
        OUTPUT
    end
  end

  def place_order_with_input(*order)
    input = StringIO.new(order.join("\n") + "\n" + "\n" + "\n")
    output = StringIO.new

    takeaway = Takeaway.new(input: input, output: output)
    takeaway.order

    output.string
  end
end
