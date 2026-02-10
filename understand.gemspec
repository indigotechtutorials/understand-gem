Gem::Specification.new do |s|
  s.name        = "understand"
  s.version     = "0.0.1"
  s.summary     = "Understand your codebase with a LLM"
  s.description = "A gem to help you understand your codebases using the power of LLM's ( not a vibe coding tool )"
  s.authors     = ["Indigo Tech"]
  s.email       = "indigo@tech.tut"
  s.files       = ["lib/understand.rb"]
  s.executables << "understand"
  s.homepage    =
    "https://rubygems.org/gems/understand"
  s.license       = "MIT"
  s.add_dependency "rllama", "~> 1.0.3"
  s.add_dependency "bubbletea", "~> 0.1.0"
  s.add_dependency "lipgloss", "~> 0.2.0"
end
