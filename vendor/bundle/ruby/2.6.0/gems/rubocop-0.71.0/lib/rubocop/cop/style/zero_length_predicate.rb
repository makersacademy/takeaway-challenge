# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks for numeric comparisons that can be replaced
      # by a predicate method, such as receiver.length == 0,
      # receiver.length > 0, receiver.length != 0,
      # receiver.length < 1 and receiver.size == 0 that can be
      # replaced by receiver.empty? and !receiver.empty.
      #
      # @example
      #   # bad
      #   [1, 2, 3].length == 0
      #   0 == "foobar".length
      #   array.length < 1
      #   {a: 1, b: 2}.length != 0
      #   string.length > 0
      #   hash.size > 0
      #
      #   # good
      #   [1, 2, 3].empty?
      #   "foobar".empty?
      #   array.empty?
      #   !{a: 1, b: 2}.empty?
      #   !string.empty?
      #   !hash.empty?
      class ZeroLengthPredicate < Cop
        ZERO_MSG = 'Use `empty?` instead of `%<lhs>s %<opr>s %<rhs>s`.'
        NONZERO_MSG = 'Use `!empty?` instead of ' \
                      '`%<lhs>s %<opr>s %<rhs>s`.'

        def on_send(node)
          check_zero_length_predicate(node)
          check_nonzero_length_predicate(node)
        end

        def autocorrect(node)
          lambda do |corrector|
            corrector.replace(node.loc.expression, replacement(node))
          end
        end

        private

        def check_zero_length_predicate(node)
          zero_length_predicate = zero_length_predicate(node)

          return unless zero_length_predicate

          lhs, opr, rhs = zero_length_predicate

          return if non_polymorphic_collection?(node)

          add_offense(
            node,
            message: format(ZERO_MSG, lhs: lhs, opr: opr, rhs: rhs)
          )
        end

        def check_nonzero_length_predicate(node)
          nonzero_length_predicate = nonzero_length_predicate(node)

          return unless nonzero_length_predicate

          lhs, opr, rhs = nonzero_length_predicate

          return if non_polymorphic_collection?(node)

          add_offense(
            node,
            message: format(NONZERO_MSG, lhs: lhs, opr: opr, rhs: rhs)
          )
        end

        def_node_matcher :zero_length_predicate, <<-PATTERN
          {(send (send (...) ${:length :size}) $:== (int $0))
           (send (int $0) $:== (send (...) ${:length :size}))
           (send (send (...) ${:length :size}) $:<  (int $1))
           (send (int $1) $:> (send (...) ${:length :size}))}
        PATTERN

        def_node_matcher :nonzero_length_predicate, <<-PATTERN
          {(send (send (...) ${:length :size}) ${:> :!=} (int $0))
           (send (int $0) ${:< :!=} (send (...) ${:length :size}))}
        PATTERN

        def replacement(node)
          receiver = zero_length_receiver(node)
          return "#{receiver.source}.empty?" if receiver

          "!#{other_receiver(node).source}.empty?"
        end

        def_node_matcher :zero_length_receiver, <<-PATTERN
          {(send (send $_ _) :== (int 0))
           (send (int 0) :== (send $_ _))
           (send (send $_ _) :<  (int 1))
           (send (int 1) :> (send $_ _))}
        PATTERN

        def_node_matcher :other_receiver, <<-PATTERN
          {(send (send $_ _) _ _)
           (send _ _ (send $_ _))}
        PATTERN

        # Some collection like objects in the Ruby standard library
        # implement `#size`, but not `#empty`. We ignore those to
        # reduce false positives.
        def_node_matcher :non_polymorphic_collection?, <<-PATTERN
          {(send (send (send (const nil? :File) :stat _) ...) ...)
           (send (send (send (const nil? {:Tempfile :StringIO}) {:new :open} ...) ...) ...)}
        PATTERN
      end
    end
  end
end
