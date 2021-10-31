require 'dishes'
describe Dishes do
  let(:menu1) { Dishes.new ({dish: 'Pizza', price: 5}) }
  describe '#list' do
    context 'given a menu with one dish' do
      it 'outputs a list of dish and price' do
<<<<<<< HEAD
        expect { menu1.list }.to output('Pizza: £5\\n').to_stdout
=======
        expect { menu1.list }.to output(/Pizza: £5\n/).to_stdout
>>>>>>> refactor_test
      end   
    end

    context 'given a menu with two dishes' do
    before do
      menu1.add({dish: 'Pasta', price: 3})
    end
      it 'outputs a list of dishes and prices'do
<<<<<<< HEAD
        expect { menu1.list }.to output('Pizza: £5\\nPasta: £3\\n').to_stdout 
=======
        expect { menu1.list }.to output(/Pizza: £5\nPasta: £3\n/).to_stdout 
>>>>>>> refactor_test
      end
    end
  end
end


