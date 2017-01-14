require 'menu'

describe Menu do

  subject(:takeaway) { described_class.new }

  it 'should respond to the method see_dishes' do
    expect(takeaway).to respond_to(:see_dishes)
  end

  it 'should respond to the method select_dishes' do
    expect(takeaway).to respond_to(:select_dishes)
  end

  it 'should raise an error if the wrong number of dishes is entered' do
    expect { takeaway.select_dishes("Calzone", "Margherita Pizza", 1) }.to raise_error("You've entered 2 dishes rather than the 1 that you expected!")
  end
end
