require 'order'

describe Order do
  it 'can create an instance of oystercard' do
    expect(subject).to be_kind_of(Order)
  end
  #
  # it 'can respond to see_menu' do
  #   expect(subject.see_menu).to respond_to(:see_menu)
  # end
end
