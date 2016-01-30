require 'joes'

describe 'Joe\'s Takeaway' do

  it 'so a customer can see a menu, a menu is a feature' do
    joes = Joes.new
    expect{ joes.menu }.not_to raise_error
  end

end
