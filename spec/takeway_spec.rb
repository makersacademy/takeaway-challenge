require_relative '../lib/takeaway.rb'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:dish) { double(:dish) }
  let(:menu) { Menu.new }

  it 'should display the menu' do
    expect(subject).to respond_to(:view_menu)
  end

  it 'should list all the items in the menu' do
    expect(takeaway.view_menu).to eq 'Chicken £3.78 | Pasta £4.59 | Salad £2.86'
  end

  it 'should allow the creation of a new order' do
    expect(takeaway.create_order(:dish)).to eq [:dish]
  end

  it 'should check if order is not empty' do
    expect { takeaway.view_order }.to raise_error 'You have not ordered anything yet!'
  end

  it "should allow adding more dishes in the order"do
    expect {takeaway.add_more_dishes(:dish)}.to change { order.current_order.length }.by 1 
  end
end
