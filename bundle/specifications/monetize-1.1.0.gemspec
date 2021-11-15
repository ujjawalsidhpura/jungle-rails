# -*- encoding: utf-8 -*-
# stub: monetize 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "monetize".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shane Emmons".freeze]
  s.date = "2014-12-16"
  s.description = "A library for converting various objects into `Money` objects.".freeze
  s.email = ["shane@emmons.io".freeze]
  s.homepage = "https://github.com/RubyMoney/monetize".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.31".freeze
  s.summary = "A library for converting various objects into `Money` objects.".freeze

  s.installed_by_version = "3.2.31" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<money>.freeze, ["~> 6.5.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0.beta1"])
  else
    s.add_dependency(%q<money>.freeze, ["~> 6.5.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0.beta1"])
  end
end
