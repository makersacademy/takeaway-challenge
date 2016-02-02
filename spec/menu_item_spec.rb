require 'menu_item'

describe MenuItem do
  subject(:menu_item){described_class.new("chicken satay", 4.5)}

  it {is_expected.to respond_to :name }

  it {is_expected.to respond_to :price}

end
