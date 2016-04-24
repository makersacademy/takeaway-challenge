require 'customer'

describe Customer do

  subject(:customer) { described_class.new(menu) }
  let(:menu) { spy(:menu) }

  it '#show_menu' do
    customer.show_menu
    expect(menu).to have_received(:print_menu)
  end



end