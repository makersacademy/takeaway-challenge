#!/usr/bin/env ruby

require 'formats/formatter'

# Klass provides dummy usage of Formatter module

class Klass
  include Formatter

  def initialize
    @content = ['abc', 'def', 'ghi']
    @length = 30
  end

  def content
    @content
  end
end

describe Formatter do

  let(:obj) { Klass.new }

  describe '#content_length' do
    subject { obj.content_length }

    it 'returns combined content length plus spacing' do
      expect(subject).to eq 12
    end
  end

  describe '#get_fill' do
    before(:each) { allow(obj).to receive(:content_length).and_return(12) }
    subject { obj.get_fill('.') }

    it 'returns number of dots equal to length less content length' do
      expect(subject).to eq ('.' * 18)
    end
  end

  describe '#filled_content' do
    before(:each) { allow(obj).to receive(:get_fill).and_return('...') }
    subject { obj.filled_content(0, nil) }

    it 'returns content with fill injected at given index' do
      expect(subject).to eq ['...', 'abc', 'def', 'ghi']
    end
  end
end

