require "yaml"
require "pry"

file_path = "/Users/Kristina/development/labs/emoticon-translator-web-010818/lib/emoticons.yml"

def load_library(file_path)
    emoticons_hash = YAML.load_file(file_path)
    result = {"get_meaning" => {},
              "get_emoticon" => {}}
    
    emoticons_hash.each do |define, emojis|
        result["get_meaning"][emojis[1]] = define
        result["get_emoticon"][emojis[0]] = emojis[1]
    end
    result
end

def get_japanese_emoticon(file_path, emoticon)
    emoticons_hash = load_library(file_path)
    result = nil
    emoticons_hash["get_emoticon"].each do |eng, jap|
        if emoticon == eng
            result = jap
        end
    end
    if result == nil
        result = "Sorry, that emoticon was not found"
    end
    
    result
end

def get_english_meaning(file_path, emoticon)
    emoticons_hash = load_library(file_path)
    result = nil
    emoticons_hash["get_meaning"].each do |jap, eng_text|
        if emoticon == jap
            result = eng_text
        end
    end
    if result == nil
        result = "Sorry, that emoticon was not found"
    end
    result
end

