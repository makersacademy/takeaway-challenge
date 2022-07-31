require_relative '../lib/takeaway.rb'
describe Takeaway do
subject(:takeaway) {described_class.new(menu: menu)}
# subject(:takeaway) {described_class.new(print_menu: print_menu)}
  let(:menu) {double(:menu, print: print_menu) }
  let(:print_menu) {'rice: 3'}
 
    it "should print a list of dishes and prices" do
    expect(subject.print_menu).to eq (print_menu)
    end
  
end