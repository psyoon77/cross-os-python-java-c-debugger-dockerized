from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:11434/v1",
    api_key="ollama",
)

user_prompt = input("Prompt: ")
system_prompt = "Limit your answer to one sentence. Pretend you're a cat."

response = client.responses.create(
    model="llama3.2:1b",
    instructions=system_prompt,
    input=user_prompt,
)

print(response.output_text)

# ------------------------------------------------

# have two docker container cli ready
# curl -fsSL https://ollama.com/install.sh | sh
# ollama serve
# ollama pull llama3.2:1b
# python -m pip install openai
# cd ai
# python3 chat-ollama-openai.py

# ------------------------------------------------



# test ollama cli
# ollama run llama3.2:1b
# /bye

# which ollama
# installed models
# ollama list
# loaded/running models in memory
# ollama ps
# interactive chat
# ollama run llama3.2:1b
# unload model from memory
# ollama stop llama3.2:1b
# delete downloaded model
# ollama rm llama3.2:1b
# show model details
# ollama show llama3.2:1b
# print version
# ollama -v
# general help
# ollama --help
