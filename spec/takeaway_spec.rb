require_relative '../lib/takeaway' # requiring takeaway class file 

describe Takeaway do # expecting a takeaway class 

  subject(:takeaway) { described_class.new(menu: menu, order: order) } # creating a double 

  let(:menu) { double(:menu, print: print_menu) } # creating a double 
  let(:print_menu) { "Korma: €8" }
  let(:order) { double(:order) }
  let(:dishes) {  { korma: 2, balti: 1 } }

  it 'should have a menu with a list of dishes and their prices' do 
    expect(takeaway.print_menu).to eq(print_menu) # expecting takeaway class to respond to the print menu methid and return printed menu
  end 

  it 'should be able to order a number of several dishes' do 
    expect(order).to receive(:add).twice 
    takeaway.user_order(dishes)
  end 

end   # ending takeaway class 
