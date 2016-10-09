require 'customer'

# create a class that mocks user input and test it
# helper class whose job is to capture input
# wherever it is that you're capturing input, it has a dependancy on that class
describe Customer do

  subject(:customer) { described_class.new }
  let(:selection) { double (:selection)}

  describe 'initialization' do
    it 'will have no order stored' do
      expect(subject.order). to be_empty
    end
  end
  # it 'will display a list of dishes with prices' do
  #   expect(subject.menu). to eq(puts "Here are the menu items.")
  #
  # end
  it 'will allow customer to select from the menu' do
    expect(subject.new_order).to eq 1
  end
  it 'will allow customer to add selection to their order' do
    subject.new_order
    selection = 1
    expect(subject.create_order(selection)).to eq order
  end
end
