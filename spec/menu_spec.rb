require 'csv'

describe Menu do
  subject(:menu) { Menu.new('./spec/dishes_spec.csv') }

  describe '#display_available_dishes' do

    context 'when some dishes are unavailable' do
      it 'should only return available dish names and prices' do
        expect(menu.display_available_dishes).to include(:pizza => 9.5, :pasta => 8.2)
      end

      it 'should not return unavailable dishes' do
        expect(menu.display_available_dishes).not_to include(:tiramisu => 4.5)
      end
    end
  end
end
