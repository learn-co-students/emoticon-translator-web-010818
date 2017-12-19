# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  # code goes here
  emoticons_yaml = YAML.load_file(file_path)

  emoticons_meaning = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }


  emoticons_yaml.each do |meaning, emoticon_array|
    emoticon_array.each_with_index do |emoticon, index|
      if index == 0
        emoticons_meaning["get_emoticon"][emoticon] = emoticon_array[1]
      elsif index == 1
        emoticons_meaning["get_meaning"][emoticon] = meaning
      end
    end
  end

  emoticons_meaning

end

def get_japanese_emoticon(file_path, emoticon)
  emoticons_meaning = load_library(file_path)
  # binding.pry
  if emoticons_meaning["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    emoticons_meaning["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons_meaning = load_library(file_path)
  if emoticons_meaning["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    emoticons_meaning["get_meaning"][emoticon]
  end
end

{"get_meaning"=>
  {"\u261C(\u2312\u25BD\u2312)\u261E"=>"angel",
   "\u30FD(\uFF4F`\u76BF\u2032\uFF4F)\uFF89"=>"angry",
   "(\u0398\u03B5\u0398;)"=>"bored",
   "(\u309C.\u309C)"=>"confused",
   "(#^.^#)"=>"embarrased",
   ">\u309C))))\u5F61"=>"fish",
   "(^0_0^)"=>"glasses",
   "(\uFFE3\u30FC\uFFE3)"=>"grinning",
   "(\uFF3E\uFF56\uFF3E)"=>"happy",
   "(*^3^)/~\u2606"=>"kiss",
   "(\uFF34\u25BD\uFF34)"=>"sad",
   "o_O"=>"surprised",
   "(^_-)"=>"wink"},
 "get_emoticon"=>
  {"O:)"=>"\u261C(\u2312\u25BD\u2312)\u261E",
   ">:("=>"\u30FD(\uFF4F`\u76BF\u2032\uFF4F)\uFF89",
   ":O"=>"(\u0398\u03B5\u0398;)",
   "%)"=>"(\u309C.\u309C)",
   ":$"=>"(#^.^#)",
   "><>"=>">\u309C))))\u5F61",
   "8D"=>"(^0_0^)",
   "=D"=>"(\uFFE3\u30FC\uFFE3)",
   ":)"=>"(\uFF3E\uFF56\uFF3E)",
   ":*"=>"(*^3^)/~\u2606",
   ":'("=>"(\uFF34\u25BD\uFF34)",
   ":o"=>"o_O",
   ";)"=>"(^_-)"}}
