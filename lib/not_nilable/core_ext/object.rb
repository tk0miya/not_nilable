# frozen_string_literal: true

class Object
  # Returns +self+.
  #
  # This method asserts that the receiver is not +nil+. Since +Object+ is not
  # +NilClass+, the assertion succeeds and +self+ is returned. The +message+
  # parameter is accepted for API parity with +NilClass#not_nil!+ but is
  # ignored.
  #
  # @rbs message: String?
  def not_nil!(message = nil) #: self # rubocop:disable Lint/UnusedMethodArgument
    self
  end
end
