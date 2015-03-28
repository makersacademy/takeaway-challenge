require 'takeaway'

context 'Takeaway' do
  takeaway = Takeaway.new

  it 'knows Bob is their customer' do
    expect(takeaway.customer 'Bob').to eq 'Bob'
  end
end
