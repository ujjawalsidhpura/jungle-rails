# -*- encoding: utf-8 -*-
# stub: money 6.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "money".freeze
  s.version = "6.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shane Emmons".freeze]
  s.date = "2015-02-03"
  s.description = "A Ruby Library for dealing with money and currency conversion.".freeze
  s.email = ["shane@emmons.io".freeze]
  s.homepage = "http://rubymoney.github.io/money".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "Please note the following API changes in Money version 6\n\n - Money#amount, Money#dollars methods now return instances of BigDecimal (rather than Float).\n\nPlease read the migration notes at https://github.com/RubyMoney/money#migration-notes\nand choose the migration that best suits your application.\n\nTest responsibly :-)\n".freeze
  s.rubygems_version = "3.2.31".freeze
  s.summary = "A Ruby Library for dealing with money and currency conversion.".freeze

  s.installed_by_version = "3.2.31" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<i18n>.freeze, [">= 0.6.4", "<= 0.7.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_development_dependency(%q<kramdown>.freeze, ["~> 1.1"])
  else
    s.add_dependency(%q<i18n>.freeze, [">= 0.6.4", "<= 0.7.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<kramdown>.freeze, ["~> 1.1"])
  end
end
