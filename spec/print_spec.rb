require './lib/printer.rb'
describe Printer do
  context 'print the menu' do
    it "should display the menu in a readable fashion" do
      printer = Printer.new
      expect(printer.print_menu).to eq "Takeaway Menu \n1. Chicken £6 \n2. Pizza £10 \n3. Kebab £4 \n4. Chips £2 \n5. Fish £5 \n6. Curry £9 \n"
    end
  end
end
