require 'order'

describe Order do
    it { is_expected.to respond_to(:add_dishes)}
    it { is_expected.to respond_to(:dish_exists?)}
    it { is_expected.to respond_to(:print_prices)}


end