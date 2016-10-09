require 'restaurant'

describe Restaurant do

subject(:restaurant) {described_class.new}

describe 'confirm' do
  before do
    allow(restaurant).to receive(:confirm_order).with(15)
    expect
  end
  it 'sends a confirmation text' do
    expect(restaurant).to receive(:confirm_order).with(15).and_return(subject.messager.send("Thanks for your order. That's £15"))
  end
end

end
