# frozen_string_literal: true

require_relative "not_nilable/version"

module NotNilable
  class NilAssertionError < StandardError
  end
end

require_relative "not_nilable/core_ext/object"
require_relative "not_nilable/core_ext/nil_class"
