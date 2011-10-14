# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vagrant-guard/version"

Gem::Specification.new do |s|
  s.name        = "vagrant-guard"
  s.version     = "0.0.1"
  s.authors     = ["Andrew Havens"]
  s.email       = ["email@andrewhavens.com"]
  s.homepage    = "http://rubygems.org/gems/vagrant-guard"
  s.summary     = %q{A Vagrant plugin for running Guard on your Vagrant VM.}
  s.description = %q{A Vagrant plugin for running Guard on your Vagrant VM.}
	
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
