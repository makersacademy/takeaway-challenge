# frozen_string_literal: true

require 'messenger'

describe Messenger do
  subject(:messenger) { described_class.new }

  describe '#send' do
    it 'is able to try to send a text message' do
      expect(messenger).to respond_to(:send)
    end
  end
end
