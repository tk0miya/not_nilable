# frozen_string_literal: true

RSpec.describe NotNilable do
  describe "Object#not_nil!" do
    it "returns self for a String" do
      value = "hello"
      expect(value.not_nil!).to equal(value)
    end

    it "returns self for an Integer" do
      expect(42.not_nil!).to eq(42)
    end

    it "returns self for false" do
      expect(false.not_nil!).to be(false)
    end

    it "returns self for false even when a message is supplied" do
      expect(false.not_nil!("would be ignored")).to be(false)
    end

    it "returns self for an Array" do
      value = [1, 2, 3]
      expect(value.not_nil!).to equal(value)
    end

    it "returns self for a Hash" do
      value = { a: 1 }
      expect(value.not_nil!).to equal(value)
    end

    it "ignores the message argument" do
      expect("hello".not_nil!("custom message")).to eq("hello")
    end
  end

  describe "NilClass#not_nil!" do
    it "raises NilAssertionError when called on nil" do
      expect { nil.not_nil! }.to raise_error(NotNilable::NilAssertionError)
    end

    it "raises with a default message when none is provided" do
      expect { nil.not_nil! }.to raise_error(NotNilable::NilAssertionError, "Nil assertion failed")
    end

    it "raises with the supplied message" do
      expect { nil.not_nil!("expected a value here") }
        .to raise_error(NotNilable::NilAssertionError, "expected a value here")
    end
  end
end
