# -*- encoding: utf-8 -*-
# stub: json 1.8.3 ruby lib
# stub: ext/json/ext/generator/extconf.rb ext/json/ext/parser/extconf.rb ext/json/extconf.rb

Gem::Specification.new do |s|
  s.name = "json".freeze
  s.version = "1.8.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Florian Frank".freeze]
  s.date = "2015-06-01"
  s.description = "This is a JSON implementation as a Ruby extension in C.".freeze
  s.email = "flori@ping.de".freeze
  s.extensions = ["ext/json/ext/generator/extconf.rb".freeze, "ext/json/ext/parser/extconf.rb".freeze, "ext/json/extconf.rb".freeze]
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze, "ext/json/ext/generator/extconf.rb".freeze, "ext/json/ext/parser/extconf.rb".freeze, "ext/json/extconf.rb".freeze]
  s.homepage = "http://flori.github.com/json".freeze
  s.licenses = ["Ruby".freeze]
  s.rdoc_options = ["--title".freeze, "JSON implemention for Ruby".freeze, "--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "3.2.31".freeze
  s.summary = "JSON Implementation for Ruby".freeze

  s.installed_by_version = "3.2.31" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<permutation>.freeze, [">= 0"])
    s.add_development_dependency(%q<sdoc>.freeze, ["~> 0.3.16"])
  else
    s.add_dependency(%q<permutation>.freeze, [">= 0"])
    s.add_dependency(%q<sdoc>.freeze, ["~> 0.3.16"])
  end
end
