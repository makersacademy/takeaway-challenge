require 'menu'

describe Menu do

  describe '#show_menu' do

    let(:menu) { { "korma" => 7, "tikka" => 8, "jalfrezi" => 9, "rice" => 3, "naan" => 3 } }

    it 'should display the menu' do
      expect(subject.show_menu).to eq menu
    end
  end
end
