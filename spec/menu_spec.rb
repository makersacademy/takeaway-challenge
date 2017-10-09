require 'menu'

describe Menu do
  let(:menu) { described_class.new(stream: stream) }
  let(:stream) { double :stream, puts: nil }
  it 'has a list of dishes' do
    expect(menu.dishes).not_to be_nil
  end
  it 'can show dishes' do
    expect(stream).to receive(:puts).with("sushi: £5.99\npizza: £7.99\nburger: £4.99\npie: £15.99\nwater: £2.99\nbeer: £3.99")
    menu.show
  end
end
