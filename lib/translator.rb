require 'yaml'
require 'pry'

def load_library(yaml_file)
  file = YAML.load_file(yaml_file)
  final = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  file.each do |emotion, emoticons_arr|
    final['get_meaning'][emoticons_arr[1]] = emotion
    final['get_emoticon'][emoticons_arr[0]] = emoticons_arr[1]
  end
  final
end

def get_japanese_emoticon (yaml_file, eemo)
  file = load_library(yaml_file)
  if file['get_emoticon'].include?(eemo)
    return file['get_emoticon'][eemo]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (yaml_file, jemo)
  file = load_library(yaml_file)
  if file['get_meaning'].include?(jemo)
    return file['get_meaning'][jemo]
  else
    return "Sorry, that emoticon was not found"
  end
end
