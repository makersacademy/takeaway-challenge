require 'menu'

describe Menu do

  describe '#initialize' do

    context 'when new menu object created' do
      it 'contains pizza costing 8' do
        expect(subject.menu[:pizza]).to eq 8.00
      end

      it 'contains pizza costing 8 and burger costing 5' do
        expect(subject.menu[:burger]).to eq 5.00
      end

      it 'has a hash with 5 items' do
        menu = subject.menu
        expect(menu.count).to eq 5
      end
    end

  end

  describe '#show_menu' do

    context 'calls the show_menu method on the menu object' do
      it { is_expected.to respond_to(:show_menu) }

      it 'lists the items and prices on the menu' do
        expect do
          subject.show_menu
        end.to output("pizza: £8.0\nburger: £5.0\nchips: £2.0\nfish: £6.0\nfalafel_wrap: £4.5\n").to_stdout
      end
    end
  end

end
