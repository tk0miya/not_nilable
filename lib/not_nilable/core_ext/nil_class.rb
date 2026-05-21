# frozen_string_literal: true

class NilClass
  # Raises +NotNilable::NilAssertionError+.
  #
  # This method asserts that the receiver is not +nil+. Since the receiver
  # _is_ +nil+, the assertion fails and an exception is raised. An optional
  # +message+ may be supplied to customize the exception message.
  #
  # @rbs message: String?
  def not_nil!(message = nil) #: bot
    raise NotNilable::NilAssertionError, message || "Nil assertion failed"
  end
end
