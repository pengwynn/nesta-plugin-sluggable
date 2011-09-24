# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nesta-plugin-sluggable/version"

Gem::Specification.new do |s|
  s.name        = "nesta-plugin-sluggable"
  s.version     = Nesta::Plugin::Sluggable::VERSION
  s.authors     = ["Wynn Netherland"]
  s.email       = ["wynn.netherland@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Sluggable posts for Nesta}
  s.description = %q{Sluggable posts for Nesta CMS}

  s.rubyforge_project = "nesta-plugin-sluggable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("nesta", ">= 0.9.11")
  s.add_development_dependency("rake")
end
