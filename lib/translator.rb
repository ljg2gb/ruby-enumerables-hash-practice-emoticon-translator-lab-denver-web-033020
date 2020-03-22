# require modules here
require 'yaml'
require 'pry'

def load_library(yaml_file)
  original_hash = YAML.load_file(yaml_file)
  new_hash = {}
  new_hash[:get_meaning] = {}
  new_hash[:get_emoticon] = {}
  
  original_hash.each do |meaning, emoticons|
        #if !new_hash[:get_meaning][emoticons[1]]
        new_hash[:get_meaning][emoticons[1]] = meaning.to_s
        #end
        
        #if !new_hash[:get_emoticon][emoticons[0]]
        new_hash[:get_emoticon][emoticons[0]] = emoticons[1].to_s
        #end
  end
  new_hash
end

def get_japanese_emoticon(yaml_file, w_emoticon)
  hash = load_library(yaml_file)
  hash[:get_emoticon].each do |key, value|
    if key == w_emoticon
      return hash[:get_emoticon][w_emoticon]
    else

    end
  end
end

def get_english_meaning(yaml_file,j_emoticon)
  hash = load_library(yaml_file)
  hash[:get_meaning].each do |key, value|
    #binding.pry
    if key == j_emoticon
      return hash[:get_meaning][j_emoticon]
    end
  end
  puts "Sorry, that emoticon was not found"
end

