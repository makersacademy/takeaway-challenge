require 'menu'

describe Menu do
    describe '#new' do
        it 'has a menu' do
            expect(subject.menu).to eq({"California Rolls" => 8, "Avocado Maki" => 7, "Edamame" => 3})
        end
    end

    describe '#print_menu' do
        it 'prints the menu' do
            expect { subject.print_menu }.to output.to_stdout 
        end
    end
end