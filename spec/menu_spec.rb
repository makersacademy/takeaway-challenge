require 'menu'

describe Menu do
  it 'contains a list of all of it\'s dishes and is able to print it' do
  	expect(subject.print_menu).to be_a_kind_of(Hash)
  end

  xit '' do
  end
end