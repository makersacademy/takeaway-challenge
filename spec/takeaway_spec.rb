require 'Takeaway'
# US1
describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, ordering: ordering, sms: sms) } # inject menu/ordering/sms to takeaway as responsibility of takeaway class should be delegateded
  # pass menu class with menu instance, pass order class with order instance to takeaway class
  let(:menu) { double(:menu, print: printed_menu) } # create double of menu to access menu from takeaway class, has method print in its Class, injected here to the takeaway class
  let(:ordering) { double(:ordering, sum: 4.98) } #create double of order class and inject line 4, US 5 ordering is responsible for sum
  let(:sms) { instance_double("SMS", deliver_sms: nil) } # create double of sms class with deliver_sms method, nil as no start value

  let(:printed_menu) { "Coffee: 0.99" }

  let(:list_of_dishes) { [Coffee: 0.99, Sandwich: 3.99]}

  before do
    allow(ordering).to receive(:add)
  end

    it 'prints the list of dishes with prices' do # print_menu inside takeaway class, now we start mit Menu zu fummeln
    expect(subject.print_menu).to eq(printed_menu)
  end
  # US1
  # US2
  it 'can order some dishes from list_of_dishes' do # create a method that can place order
    expect(ordering).to receive(:add)
    subject.place_order(list_of_dishes)
  end
  # US4
  it 'knows the sum of the order' do
    sum = subject.place_order(list_of_dishes)
    expect(sum).to eq(4.98)
  end

  it 'send sms when order placed' do
    expect(sms).to receive(:deliver_sms)
    subject.place_order(list_of_dishes)
  end
end
