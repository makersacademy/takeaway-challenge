require 'takeaway'


describe Takeaway do

  def ignore_puts
    before do
       $stdout.stub(:write)
    end
 end

  subject(:takeaway) { Takeaway.new }
  let(:secret_item) { "Chili Burger" }

  before do
    allow(takeaway).to receive(:send_text)
  end

  it 'loads a secret item' do
    allow(takeaway.menu).to receive(:new).and_return(secret_item)
    expect(takeaway.menu.new).to eq('Chili Burger')
  end

  it 'adds an item to basket' do
    takeaway.add('cheese pizza')
  expect(takeaway.items.length).to eq(1)
  end

  it 'raises error when non-existent item is ordered' do
  expect{ takeaway.add('chese piza') }.to raise_error "This item is not available.  Please select another item."
  end

  it 'adds price to balance' do
    takeaway.add('cheese pizza')
  expect(takeaway.balance).to eq(12.99)
  end

  it 'sends a payment confirmation text message' do
    expect(takeaway).to receive(:send_text)
    takeaway.complete_order
  end

end