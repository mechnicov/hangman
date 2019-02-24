class Writer
  def initialize(reader)
    @reader = reader
  end

  def write_to_file(path)
    puts "\nВводите каждое слово с новой строки.\nДля завершения на новой строке наберите 'Выход!'"
    words = []
    word  = nil
    while word != 'выход!'
      word = STDIN.gets.chomp.downcase
      words << word
    end
    words.pop
    words += @reader.words_from_file(path)

    words.map! do |word|
      word.downcase.split('').map do |letter|
        letter = 'е' if letter == 'ё'
        letter
      end.join
    end
    words.uniq!

    file = File.new(path, 'w')
    words.each { |word| file.puts(word) }
    file.close
  end
end
