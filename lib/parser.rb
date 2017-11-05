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
class Parser
  def initialize
    @regex = /(\s*\d{3})(\s*x\s*\d)?/
    @matches = nil
  end

  def to_hash(order)
    get_matches(order)
    raise ParseError, 'malformed order' unless matches_whole? order
    raise DuplicateError, 'duplicate keys' unless no_duplicates?
    Hash[@matches.map { |match| unpack(match) }]
  end

  def get_errors(order)
    order.gsub(@regex, 0.chr).split(0.chr).select { |i| i.length > 0 }
  end

  def get_duplicates(order)
    get_matches(order)
    item_numbers.select { |number| item_numbers.count(number) > 1 }.uniq
  end

  private

  def get_matches(order)
    @matches = order.to_enum(:scan, @regex).map { Regexp.last_match }
  end

  def item_numbers
    @matches.map { |match| match.captures.first.strip }
  end

  def no_duplicates?
    item_numbers.uniq.length == item_numbers.length
  end

  def matches_whole?(order)
    @matches.map(&:to_s).join('') == order.rstrip
  end

  def unpack(match)
    match.captures.map { |group| group ? group_to_i(group) : 1 }
  end

  def group_to_i(group)
    group.match(/\d+/).to_s.to_i
  end
end
