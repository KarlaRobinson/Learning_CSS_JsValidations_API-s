# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 



File.open("words").each do |row|
  row.each_line do |word|
    Word.create(base_word: word.chomp, canonical: word.chomp.downcase.split("").sort.join)
  end
end



