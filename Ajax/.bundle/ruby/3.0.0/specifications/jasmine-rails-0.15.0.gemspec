# -*- encoding: utf-8 -*-
# stub: jasmine-rails 0.15.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jasmine-rails".freeze
  s.version = "0.15.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Searls".freeze, "Mark Van Holstyn".freeze, "Cory Flanigan".freeze]
  s.date = "2019-04-17"
  s.description = "Provides a Jasmine Spec Runner that plays nicely with Rails 3.2 assets and sets up jasmine-headless-webkit".freeze
  s.email = ["searls@gmail.com".freeze, "mvanholstyn@gmail.com".freeze, "seeflanigan@gmail.com".freeze]
  s.homepage = "http://github.com/searls/jasmine-rails".freeze
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Makes Jasmine easier on Rails 3.2 & up".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<railties>.freeze, [">= 3.2.0"])
    s.add_runtime_dependency(%q<sprockets-rails>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<jasmine-core>.freeze, [">= 1.3", "< 4.0"])
    s.add_runtime_dependency(%q<phantomjs>.freeze, [">= 1.9"])
    s.add_development_dependency(%q<github_changelog_generator>.freeze, [">= 0"])
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.2.0"])
    s.add_dependency(%q<sprockets-rails>.freeze, [">= 0"])
    s.add_dependency(%q<jasmine-core>.freeze, [">= 1.3", "< 4.0"])
    s.add_dependency(%q<phantomjs>.freeze, [">= 1.9"])
    s.add_dependency(%q<github_changelog_generator>.freeze, [">= 0"])
  end
end
