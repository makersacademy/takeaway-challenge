require 'messager'

RSpec.describe Messager do

  subject(:messager)  {described_class.new}

  it {is_expected.to respond_to(:send_text)}
end