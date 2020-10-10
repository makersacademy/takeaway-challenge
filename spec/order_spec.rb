require 'order'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  it "shows menu with price" do
    expect(subject.menu).to eq('Pizza: 4$')
  end
end





    # it 'checks menu' do
    #   menu = {
    #     pizza: 1,
    #     soup: 2
    #   }
    #
    # end
