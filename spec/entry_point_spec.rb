require 'entry_point'

 describe ".take_order" do

    def with_captured_stdout
        original_stdout = $stdout
        $stdout = StringIO.new
        yield
        $stdout.string   
    ensure
        $stdout = original_stdout
    end

    it "should ask for the order" do
      allow($stdin).to receive(:gets).and_return("7404785572", "1", "2", "2", "1", "checkout")
      str = with_captured_stdout { take_order }
      expect(str).to include "total = 45"
    end

  end

#   describe ".customer_phone_number" do
#     it "should return cusotmers phone number" do
#       allow($stdin).to receive(:gets).and_return( "7404785572", "1", "2", "2", "1", "checkout")
#       menu = Menu.new
#       order = Order.new(menu)
#       take_order(menu, order)
#       expect(customer_phone_number).to eq "+447404785572"
#     end
#   end