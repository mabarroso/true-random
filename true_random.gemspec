$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "true-random/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "true-random"
  s.version     = TrueRandom::VERSION
  s.authors     = ["Miguel Adolfo Barroso", "eonrubia"]
  s.email       = ["mabarroso@mabarroso.com"]
  s.homepage    = "http://github.com/mabarroso/true-random"
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Get true random numbers from RANDOM.ORG."
  s.description = "Use the true random number service of RANDOM.ORG. The randomness comes from atmospheric noise, which for many purposes is better than the pseudo-random number algorithms typically used in computer programs."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "rspec", "~> 2.7.0"
end
