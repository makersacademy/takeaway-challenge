#!/usr/bin/env ruby

require './lib/order'

# ParseError raised for poorly formed orders
class ParseError < StandardError
end

# DuplicateError raised for errors with duplicate dishes
class DuplicateError < StandardError
end

# The OrderParser class is used to parse orders received by
# SMS. It parses orders into hashes, mapping item numbers to 
# ordered quantities.

class OrderParser
  def initialize
    @regex = /(\s*\d{3})(\s*x\s*\d)?/
    @matches = nil
  end

  def to_hash(order)
    get_matches(order)
    raise ParseError, "malformed order" unless matches_whole? order
    raise DuplicateError, "duplicate keys" unless no_duplicates?
    Hash[@matches.map { |match| unpack(match) }]
  end

  private

  def get_matches(order)
    @matches = order.to_enum(:scan, @regex).map { Regexp.last_match }
  end

  def no_duplicates?
    captures = @matches.map { |match| match.captures.first.strip }
    captures.uniq.length == captures.length
  end

  def matches_whole?(order)
    @matches.map { |m| m.to_s }.join('') == order.rstrip
  end

  def unpack(match)
    match.captures.map { |group| !!group ? group_to_i(group) : 1 }
  end

  def group_to_i(group)
    group.match(/\d+/).to_s.to_i
  end
end
