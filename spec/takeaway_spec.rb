describe Takeaway do
  subject(:takeaway) { Takeaway.new }

  it 'has a menu which can be read' do
    expect(takeaway.menu).to include("Crispy Duck" => 6.99)
  end
end
