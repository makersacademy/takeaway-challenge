require 'menu'

describe Menu do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it { is_expected.to respond_to(:show_menu) }

end
