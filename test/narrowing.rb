# frozen_string_literal: true
# rbs_inline: disabled

# Type-narrowing tests for `not_nil!`.
#
# Each method below relies on `.not_nil!` narrowing `T?` to `T`. If
# narrowing breaks (e.g. the RBS for `Object#not_nil!` regresses to
# something other than `-> self`), the calls become type errors and
# show up as diagnostic diffs against `steep_expectations.yml`.
#
# The methods are annotated `#: void` because we're testing the
# intermediate expressions, not the return values — declaring an
# explicit return type would either force the narrowed type (masking
# regressions) or require redundant casts.

class NarrowingTest
  def string_optional #: void
    val = %w[alpha beta].first
    val.not_nil!.length
  end

  def integer_optional #: void
    val = [1, 2, 3].first
    val.not_nil! + 1
  end

  def array_optional #: void
    val = [[1, 2], [3, 4]].first
    val.not_nil!.first
  end

  def non_nilable_receiver #: void
    val = "hello"
    val.not_nil!.length
  end

  def bool_optional #: void
    val = [true, false].sample
    val.not_nil! & true
  end
end
