require 'takeaway'

describe 'Featuretest' do
  context '#order' do
    it 'will ask again if item mispelt' do
      output = place_order_with_input("Brocoli", "Broccoli")
      
      expect(output).to eq <<~OUTPUT
        Please type each dish you require followed by return. When you have finished your order press return twice.
        Sorry, we don't have that dish - perhaps you've made a spelling mistake?
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
