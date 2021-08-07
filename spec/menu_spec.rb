require 'menu'

describe Menu do
  subject do
    Menu.new({
      1 => { name: 'Arbroath Smokie', cost: 6 },
      2 => { name: 'Parmigiana di Melanzane', cost: 9 }
    })
  end

  it { is_expected.to respond_to :items }
end
