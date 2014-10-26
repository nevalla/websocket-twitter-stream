# -*- encoding: utf-8 -*-
# stub: em-twitter 0.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "em-twitter"
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Steve Agalloco"]
  s.date = "2014-01-24"
  s.description = "Twitter Streaming API client for EventMachine"
  s.email = ["steve.agalloco@gmail.com"]
  s.homepage = "https://github.com/spagalloco/em-twitter"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Twitter Streaming API client for EventMachine"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, ["~> 1.0"])
      s.add_runtime_dependency(%q<http_parser.rb>, ["~> 0.6"])
      s.add_runtime_dependency(%q<simple_oauth>, ["~> 0.2"])
      s.add_runtime_dependency(%q<buftok>, ["~> 0.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
    else
      s.add_dependency(%q<eventmachine>, ["~> 1.0"])
      s.add_dependency(%q<http_parser.rb>, ["~> 0.6"])
      s.add_dependency(%q<simple_oauth>, ["~> 0.2"])
      s.add_dependency(%q<buftok>, ["~> 0.2"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<eventmachine>, ["~> 1.0"])
    s.add_dependency(%q<http_parser.rb>, ["~> 0.6"])
    s.add_dependency(%q<simple_oauth>, ["~> 0.2"])
    s.add_dependency(%q<buftok>, ["~> 0.2"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
  end
end
