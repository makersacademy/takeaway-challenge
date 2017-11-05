require './lib/dialogue'
require './lib/order'
require './lib/parser'

# OrderHandler converts incoming orders into response strings.
class OrderHandler
  def initialize(menu, dialogue: Dialogue.new, parser: Parser.new)
    @menu = menu
    @dialogue = dialogue
    @parser = parser
  end

  def build_order(order, factory: Order)
    factory.from_selection(@menu, @parser.to_hash(order))
  end

  def response(string)
    order = build_order(string)
    finalise(order)
  rescue ParseError
    malformed(string)
  rescue DuplicateError
    duplicated(string)
  rescue RangeError
    missing(string)
  end

  def finalise(order)
    @dialogue.finalise(order)
  end

  def malformed(string)
    get_message(:malformed, @parser.get_errors(string))
  end

  def duplicated(string)
    get_message(:duplicated, @parser.get_duplicates(string))
  end

  def missing(order)
    get_message(:missing, @menu.get_missing(order))
  end

  private

  def get_message(name, list)
    @dialogue.send(name, list.join(', '))
  end
end
