require 'order_printer'

describe OrderPrinter do

  before(:each) do
    @dishes = { jalfrezi: { price: 3, quantity: 2 }, korma: { price: 2.5, quantity: 1 } }
    @dish = :balti
    @dish_hash = { price: 2, quantity: 4 }
  end

  context 'it should produce correctly formatted basket summary outputs' do

    it 'should collate the output for a dish into a readable line for the customer' do
      output = "balti x 4 (£8.00), "
      expect(subject.collate_output(@dish, @dish_hash)).to eq(output)
    end

    it 'should total the dishes correctly' do
      expect(subject.output_total(10)).to eq("\nThe total is £10.00")
    end

    it 'should output collated orders' do
      result = "jalfrezi x 2 (£6.00), korma x 1 (£2.50)"
      expect(subject.output_orders(@dishes)).to eq(result)
    end

    it 'should output collated orders and a total' do
      result = "jalfrezi x 2 (£6.00), korma x 1 (£2.50)\nThe total is £8.50"
      expect(subject.print_order(@dishes, 8.50)).to eq(result)
    end

  end

end
