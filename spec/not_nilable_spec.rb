# frozen_string_literal: true

RSpec.describe NotNilable do
  describe "Object#not_nil!" do
    context "with a String" do
      it "returns self" do
        value = "hello"
        expect(value.not_nil!).to equal(value)
      end
    end

    context "with an Integer" do
      it "returns self" do
        expect(42.not_nil!).to eq(42)
      end
    end

    context "with false" do
      it "returns self" do
        expect(false.not_nil!).to be(false)
      end
    end

    context "with an Array" do
      it "returns self" do
        value = [1, 2, 3]
        expect(value.not_nil!).to equal(value)
      end
    end

    context "with a Hash" do
      it "returns self" do
        value = { a: 1 }
        expect(value.not_nil!).to equal(value)
      end
    end

    context "when a message argument is supplied" do
      it "ignores the message and returns self" do
        expect(false.not_nil!("would be ignored")).to be(false)
      end
    end
  end

  describe "NilClass#not_nil!" do
    context "when called on nil" do
      it "raises NilAssertionError" do
        expect { nil.not_nil! }.to raise_error(NotNilable::NilAssertionError)
      end
    end

    context "when no message is provided" do
      it "raises with a default message" do
        expect { nil.not_nil! }.to raise_error(NotNilable::NilAssertionError, "Nil assertion failed")
      end
    end

    context "when a message is supplied" do
      it "raises with the supplied message" do
        expect { nil.not_nil!("expected a value here") }
          .to raise_error(NotNilable::NilAssertionError, "expected a value here")
      end
    end
  end
end
