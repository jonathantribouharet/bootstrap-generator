# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
	s.files = `git ls-files`.split("\n")
	s.name = "bootstrap-generator"
	s.platform = Gem::Platform::RUBY
	s.summary = "Generator for bootstrap style."
	s.homepage = "https://github.com/eviljojo22/bootstrap-generator"
	s.require_paths = ["lib"]
	s.version = "1.0"
	s.author = "Jonathan TRIBOUHARET"
	s.email = "jonathan.tribouharet@gmail.com"
end
