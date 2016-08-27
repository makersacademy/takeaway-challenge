require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  describe '#show' do
      specify{expect{menu.show}.to output.to_stdout}
  end
end
