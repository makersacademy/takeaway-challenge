require_relative '../lib/menu'

describe 'Menu' do

  subject(:menu) { Menu.new }
  let(:print_menu) { "Curry - 8.95\n" "Rice - 3.5\n" "Naan - 2.5\n" }

  # how to intialize with 2 arguments

  context 'new instance' do

    describe 'initializes with dishes' do
      it 'outputs the right hash for the key' do
        expect(subject.dish.keys[0]).to eq(:curry)
      end
    end
  end

  context 'shows the menu' do

    describe'printing menu to user' do
      it 'responds to show menu' do
        expect(subject).to respond_to(:print_menu)
      end

      it 'prints the menu out to user' do
        expect{menu.print_menu}.to output(print_menu).to_stdout
      end
    end
  end
end
