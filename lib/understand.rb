require "rllama"

class Understand
  def self.call(understand_cli)
    model = Rllama.load_model('lmstudio-community/gemma-3-1B-it-QAT-GGUF/gemma-3-1B-it-QAT-Q4_0.gguf')
    files = Dir.glob("**/*").select { |f| File.file?(f) }
    Thread.new do
      files.each do |file|
        prompt = "Help me understand my application"
        prompt_for_ai = prompt + "--- File path: #{file} Content: #{File.read(file)}"
        understand_cli.ai_response_header = "💡 🔎 Understanding #{file}"
        model.generate(prompt_for_ai) do |token|
          understand_cli.ai_response += token
        end
      end
      model.close
    end
  end
end