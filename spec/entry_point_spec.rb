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
      expect(str).to include "Your order has been accepted"
    end

  end

