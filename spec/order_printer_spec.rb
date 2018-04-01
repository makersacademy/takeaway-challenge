require 'order_printer'

describe OrderPrinter do
  describe '#pretty_print' do
    it 'pretty_prints given info' do
      class DummyClass2
        include OrderPrinter
      end
      dummy_var = DummyClass2.new
      expect(dummy_var.pretty_print(items: "Fake item1\nFake item2", status: "completed", total: 9.70)).to eq "Order summary\nFake item1\nFake item2\nTotal: 9.70\nStatus: completed"
    end
  end
end
