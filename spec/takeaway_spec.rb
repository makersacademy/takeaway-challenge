require 'takeaway'

context 'Takeaway' do
  takeaway = Takeaway.new

  it 'knows Bob is their customer' do
    expect(takeaway.customer 'Bob').to eq 'Bob'
  end

  it 'knows their menu contains 3 selections' do
    expect(takeaway.menu.count).to eq 3
  end
end
