class Word < ActiveRecord::Base

  def self.get_anagrams(word)
  canon = word.downcase.split("").sort.join

    anagrams = self.where("canonical = '#{canon}'").map do |object|
      object.base_word
    end
    
    (anagrams - [word, word.downcase, word.capitalize]).join(", ")
  end
end
