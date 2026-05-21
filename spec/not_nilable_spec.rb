# frozen_string_literal: true

RSpec.describe NotNilable do
  it "has a version number" do
    expect(NotNilable::VERSION).not_to be_nil
  end
end
