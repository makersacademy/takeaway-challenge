require 'order'

describe Order do

  let(:menu) {double(:menu)}

  it 'responds to add_dish' do
    expect(subject).to respond_to :add_dish
  end

end