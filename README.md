# NotNilable

A non-null assertion operator for Ruby. Adds `Object#not_nil!`, ported from TypeScript's `!` operator and inspired by [Crystal's `not_nil!`](https://crystal-lang.org/api/Object.html#not_nil!).

When the receiver is anything but `nil`, `.not_nil!` returns the receiver unchanged. When it is `nil`, the method raises `NotNilable::NilAssertionError`. The bundled RBS signatures let [Steep](https://github.com/soutaro/steep) narrow `T?` to `T` at the type level.

## Installation

```bash
bundle add not_nilable
```

## Usage

```ruby
require "not_nilable"

"hello".not_nil!   # => "hello"
42.not_nil!        # => 42

nil.not_nil!
# raises NotNilable::NilAssertionError: Nil assertion failed

nil.not_nil!("user must be present")
# raises NotNilable::NilAssertionError: user must be present
```

With RBS + Steep, the type is narrowed:

```ruby
val = ENV.fetch("HOME", nil)   # type: String?
val.not_nil!.length            # narrowed to String — .length is OK
```

## Development

After cloning the repo, run `bundle install`, then `bundle exec rake` to lint, run specs, and type-check.

## License

[MIT](LICENSE.txt).
