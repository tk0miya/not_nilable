# frozen_string_literal: true

require_relative "lib/not_nilable/version"

Gem::Specification.new do |spec|
  spec.name = "not_nilable"
  spec.version = NotNilable::VERSION
  spec.authors = ["Takeshi KOMIYA"]
  spec.email = ["i.tkomiya@gmail.com"]

  spec.summary = "A non-null assertion operator for Ruby: Object#not_nil!."
  spec.description = "Ports TypeScript's non-null assertion `!` to Ruby as a method, inspired by " \
                     "Crystal's `not_nil!`. The bundled RBS signatures let Steep narrow `T?` to `T` " \
                     "at the type level."
  spec.homepage = "https://github.com/tk0miya/not_nilable"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[
                        .claude/ .github/ .gitignore .rspec .rubocop.yml .vscode/
                        Gemfile Rakefile Steepfile bin/ rbs_collection. spec/ test/
                      ])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { File.basename(_1) }
  spec.require_paths = ["lib"]
end
