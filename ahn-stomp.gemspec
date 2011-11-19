# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ahn-stomp/version"

Gem::Specification.new do |s|
  s.name        = "ahn-stomp"
  s.version     = AhnStomp::VERSION
  s.authors     = ["Jay Phillips", "Ben Langfeld", "Luca Pradovera"]
  s.email       = ["blangfeld@mojolingo.com", "lpradovera@mojolingo.com"]
  s.homepage    = "https://github.com/adhearsion/ahn-stomp"
  s.summary     = %q{Plugin to provide a Stomp gateway}
  s.description = %q{This plugin provides a connection to a Stomp server and facilities to receive and send messages.}

  s.rubyforge_project = "ahn-stomp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency %q<stomp>, [">= 1.1.10"]

  s.add_runtime_dependency %q<activesupport>, [">= 3.0.10"]

  s.add_development_dependency %q<bundler>, ["~> 1.0.0"]
  s.add_development_dependency %q<rspec>, [">= 2.5.0"]
  s.add_development_dependency %q<ci_reporter>, [">= 1.6.3"]
  s.add_development_dependency %q<simplecov>, [">= 0"]
  s.add_development_dependency %q<simplecov-rcov>, [">= 0"]
  s.add_development_dependency %q<yard>, ["~> 0.6.0"]
  s.add_development_dependency %q<rake>, [">= 0"]
  s.add_development_dependency %q<mocha>, [">= 0"]
  s.add_development_dependency %q<guard-rspec>
end
