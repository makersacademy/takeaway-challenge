require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  before do
    allow(menu).to receive(:print)
    allow($stdout).to receive(:puts)
  end

  context 'when created' do
    it 'has an empty dishes list' do
      expect(menu.list).to be_empty
    end
  end

  context 'after been created' do
    let(:dish) { double :dish, name: :carbonara, price: 4.80 }
    let(:dish2) { double :dish, name: :amatriciana, price: 4.40 }

    it 'can add dishes to the list' do
      menu.add dish
      expect(menu.list).to eq(carbonara: 4.80)
    end

    it 'cannot add a dish if is already in the list' do
      menu.add dish
      expect { menu.add dish }.to raise_error
    end

    it 'can remove dishes from the list' do
      menu.add dish
      menu.remove dish
      expect(menu.list).to be_empty
    end

    it 'cannot remove a dish if is not in the list' do
      expect { menu.remove dish }.to raise_error
    end

    it 'can display the list' do
      menu.add dish
      menu.add dish2
      expect(menu.display).to eq(menu.list)
    end
  end
end
