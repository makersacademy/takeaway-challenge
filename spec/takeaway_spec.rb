require 'takeaway'

describe Takeaway do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it { is_expected.to respond_to(:show_menu) }

  it 'checks if show_menu is displaying price list' do
    expect(subject.show_menu).to include({'chicken curry' => 6, 'veg rice' => 5})
  end
  
end
