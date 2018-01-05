# require modules here
require "yaml"
require "pry"

def load_library(emoticons)
  # code goes here
  new_hash = {}
  emoticons = YAML.load_file("./lib/emoticons.yml")
  emoticons.each do |meaning, emoticons|
    new_hash["get_meaning"] = {} if new_hash["get_meaning"] == nil
    new_hash["get_meaning"][emoticons[1]] = meaning
    new_hash["get_emoticon"] = {} if new_hash["get_emoticon"] == nil
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  new_hash
end

def get_japanese_emoticon(emoticons, emoticon)
  # code goes here
  result = ''
  library = load_library(emoticons)
  if library["get_emoticon"].keys.include?(emoticon)
    result = library["get_emoticon"][emoticon]
  else
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(emoticons, emoticon)
  # code goes here
  result = ''
  library = load_library(emoticons)
  if library["get_meaning"].keys.include?(emoticon)
    result = library["get_meaning"][emoticon]
  else
    result = "Sorry, that emoticon was not found"
  end
  result
end
