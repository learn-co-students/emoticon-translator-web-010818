require 'yaml'
require 'pry'

def load_library(file)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  YAML.load_file(file).each do |name, symbol_array|
    english, japanese = symbol_array

    new_hash["get_meaning"][japanese] = name
    new_hash["get_emoticon"][english] = japanese
  end
  new_hash
end

=begin
#get_meaning => "☜(⌒▽⌒)☞" => "angel",
#get_emoticon => "(Ｔ▽Ｔ)", ";)" => "(^_-)"}
#new_hash => {get_meaning =>
                {"☜(⌒▽⌒)☞" => "angel"},
             {get_meaning =>
                {"(Ｔ▽Ｔ)", ";)" => "(^_-)"}
              }
=end

def get_japanese_emoticon(file, emoticon)

  load = load_library(file)

  if load["get_emoticon"].keys.include?(emoticon)
    load["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  load = load_library(file)

  if load["get_meaning"].keys.include?(emoticon)
    load["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end



=begin
Write a method that loads the emoticons.yml file.

Write a method that will take a traditional Western emoticon,
like :) and translate it to its Japanese version. It will rely
on the method above. Refer to the table below for translations.

Write a method that takes a Japanese emoticon and returns its
meaning in English. This method will also rely on the first
method you wrote, the YAML file loader.
=end
