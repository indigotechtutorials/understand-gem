require "rllama"

class Understand
  attr_reader :user_prompt
  def initialize(user_prompt)
    @user_prompt = user_prompt
  end

  def call
    model = Rllama.load_model('lmstudio-community/gemma-3-1B-it-QAT-GGUF/gemma-3-1B-it-QAT-Q4_0.gguf')
    files = Dir.glob("**/*").select { |f| File.file?(f) }
    files.each do |file|
      prompt_for_ai = user_prompt + "--- File path: #{file} Content: #{File.read(file)}"
      puts "💡 🔎 Understanding #{file}"
      result = model.generate(prompt_for_ai) do |token|
        print token
      end
    end
    model.close
  end
end