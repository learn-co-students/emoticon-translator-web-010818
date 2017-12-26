require "yaml"

def load_library(yaml)
  library = YAML.load_file(yaml)
  result = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  library.each do |meaning, emoticon_arr|
    result["get_meaning"][emoticon_arr[1]] = meaning
    result["get_emoticon"][emoticon_arr[0]] = emoticon_arr[1]
  end

  result
end

def get_japanese_emoticon(yaml, emoticon)
  library = load_library(yaml)

  if library["get_emoticon"].keys.include?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml, emoticon)
  library = load_library(yaml)

  if library["get_meaning"].keys.include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
