# -*- encoding: utf-8 -*-
# stub: jasmine-core 3.99.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jasmine-core".freeze
  s.version = "3.99.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gregg Van Hove".freeze]
  s.date = "2022-01-01"
  s.description = "Test your JavaScript without any framework dependencies, in any environment,\nand with a nice descriptive syntax.\n\nJasmine for Ruby is deprecated. The direct replacment for the jasmine-core\ngem is the jasmine-core NPM package. If you are also using the jasmine gem,\nwe recommend using the jasmine-browser-runner NPM package instead. It\nsupports all the same scenarios as the jasmine gem gem plus Webpacker. See\nhttps://jasmine.github.io/setup/browser.html for setup instructions, and\nhttps://github.com/jasmine/jasmine-gem/blob/main/release_notes/3.9.0.md\nfor other options.\n".freeze
  s.email = "jasmine-js@googlegroups.com".freeze
  s.homepage = "http://jasmine.github.io".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.22".freeze
  s.summary = "JavaScript BDD framework".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
