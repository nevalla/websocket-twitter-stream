# -*- encoding: utf-8 -*-
# stub: qtc-sdk 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "qtc-sdk"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jari Kolehmainen"]
  s.date = "2014-08-05"
  s.description = "Qt Cloud Services SDK for Ruby"
  s.email = ["jari.kolehmainen@gmail.com"]
  s.files = [".gitignore", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "lib/qtc-sdk.rb", "lib/qtc/client.rb", "lib/qtc/eds/client.rb", "lib/qtc/eds/collection.rb", "lib/qtc/eds/user_collection.rb", "lib/qtc/eds/usergroup_collection.rb", "lib/qtc/errors.rb", "lib/qtc/version.rb", "qtc-sdk.gemspec", "spec/spec_helper.rb", "spec/unit/qtc/client_spec.rb"]
  s.homepage = "https://github.com/jakolehm/qtc-sdk-ruby"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Qt Cloud Services SDK for Ruby"
  s.test_files = ["spec/spec_helper.rb", "spec/unit/qtc/client_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_runtime_dependency(%q<httpclient>, ["~> 2.3"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<httpclient>, ["~> 2.3"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.14.0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<httpclient>, ["~> 2.3"])
  end
end
