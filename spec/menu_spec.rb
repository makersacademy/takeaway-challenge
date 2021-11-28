require 'menu'

describe Menu do

    describe '#show_menu' do
      it { is_expected.to respond_to(:show_menu) }
      it { is_expected.to respond_to(:list_of_dishes_with_prices)}
    end

    describe '#order' do
        it { is_expected.to respond_to(:order) }
    end

end