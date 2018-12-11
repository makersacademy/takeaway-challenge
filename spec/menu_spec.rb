require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new }

  it 'shows a list of dishes and prices' do
    expect{ menu.list_food }.to_not raise_error
  end

  context '#Making an order' do
    it 'makes an order' do
      allow_any_instance_of(Menu).to receive(:make_order).and_return(["2 pizza"])
      expect(menu.make_order).to eq(["2 pizza"])
    end

    it 'checks that the number of items order and their total sum match' do
      allow(menu).to receive(:total).and_return(5)
      allow(menu).to receive(:sum).and_return(5)
      expect(menu).to be_correct
    end
  end
end
