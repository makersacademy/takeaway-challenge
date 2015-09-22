require_relative '../lib/menu.rb'

describe Menu do

  let(:basket){double (:basket)}

      it 'can show a list of dishes' do
        menu = Menu.new
        expect(menu.dishes).to eq(naan: 100, daal: 300, rice: 200)
      end


end
