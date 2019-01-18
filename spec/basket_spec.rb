# todo:
# make user input to select dishes easier

require 'basketprinter'
describe BasketPrinter do
  let(:selection) {{chips: 1, curry: 3}}
  let(:options) {{chips: 2, curry: 3.25}}
  let(:basket) {basket = BasketPrinter.new(selection , options)}
  describe "#initialize" do
    it "stores the list of items passed to it" do
      expect(basket.options).to eq options
    end

    it "stores the selection passed to it" do
      expect(basket.selection).to eq selection
    end
  end

  describe "#print_invoice" do
    it "prints out formatted invoice for user to check" do
      expect{basket.print_invoice}.to output("Chips * 1, price = £2.00\nCurry * 3, price = £9.75\nTotal price = £11.75").to_stdout
    end
  end
end
