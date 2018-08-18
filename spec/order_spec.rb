require 'order'

describe Order do

  describe '#list_menu' do
    context 'returns #menu' do
      it { expect(subject.list_menu).to eq subject.menu }
    end
  end

end
