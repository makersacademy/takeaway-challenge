require 'takeaway'

describe Takeaway do
    describe '#view_menu' do

        it { is_expected.to respond_to(:view_menu) }

        it 'returns list of dishes and prices' do
            expect(subject.view_menu).to eq({"California Rolls" => 8, "Avocado Maki" => 7, "Edamame" => 3})
        end
        
    end
end