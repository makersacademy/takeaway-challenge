require 'Takeaway'
# US1
describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, ordering: ordering) } # inject menu to takeaway as print menu shouldn't be responsibility of takeaway class
  # pass menu class with menu instance, pass order class with order instance to takeaway class
  let(:menu) { double(:menu, print: printed_menu) } # create double of menu to access menu from takeaway class, has method print in its Class, injected here to the takeaway class
  let(:ordering) { double(:ordering, sum: 4.98) } #create double of order class and inject line 4, US 5 ordering is responsible for sum
  let(:printed_menu) { "Coffee: 0.99" }

  let(:list_of_dishes) { [Coffe: 0.99, Sandwich: 3.99]}

  it 'prints the list of dishes with prices' do # print_menu inside takeaway class, now we start mit Menu zu fummeln
    expect(takeaway.print_menu).to eq(printed_menu)
  end
  # US1
  # US2
  it 'can order some dishes from list_of_dishes' do # create a method that can place order
    expect(ordering).to receive(:add)
    subject.place_order(list_of_dishes)
  end
  # US4
  it 'knows the sum of the order' do
    allow(ordering).to receive(:add)
    sum = subject.place_order(list_of_dishes)
    expect(sum).to eq(4.98)
  end
end
