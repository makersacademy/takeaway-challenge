require 'messager'

describe Messager do
  subject(:messager) { described_class.new }
  before { allow(messager).to receive(:send_text) }

it {is_expected.to respond_to(:send_confirmation).with(1).argument }
end
