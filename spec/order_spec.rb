require 'order'

describe Order do

  it { is_expected.to respond_to :menu }

  describe '#view_menu' do

    it 'shows menu' do
       expect (subject.view_menu).to eq(@menu)
    end
  end

end
