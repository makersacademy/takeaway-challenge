require 'printer'

describe Printer do
  subject(:print) { described_class.new }
  let(:name) { 'Woahaca' }
  let(:order_summary) {{'Taco' => 2, 'Burrito' => 4}}

  it 'prints welcome message' do
    expect(print.welcome_message(name)).to eq "Welcome to #{name}!"
  end

  it 'prints receipts' do
    expect(print.receipt(order_summary,6)).to eq "Total bill: 6"
  end

end
