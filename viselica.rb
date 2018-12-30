require_relative 'lib/game'
require_relative 'lib/printer'
require_relative 'lib/reader'
require_relative 'lib/writer'

words_path = "#{__dir__}/data/words.txt"
user_input = nil
until %w[о з д].include? user_input
  STDOUT.puts "\n(О)тгадать слово, загаданное компьютером" \
              "\n(З)агадать слово для второго игрока" \
              "\n(Д)обавить слово в словарь комьютера"
  STDOUT.print "\nВаш выбор: "
  user_input = gets.chomp.downcase
end

mode = case user_input
       when 'д' then :update_words
       when 'о' then :computer
       end

reader = Reader.new

if mode == :update_words
  writer = Writer.new(reader)
  writer.write_to_file(words_path)
  STDOUT.puts 'Словарь компьютера успешно обновлён'
  exit
end

word = if mode == :computer
         reader.words_from_file(words_path).sample
       else
         reader.word_from_console
       end

game    = Game.new(word)
printer = Printer.new(game)
printer.cls
printer.intro

sleep 2

while game.in_progress?
  printer.print_status(game)
  game.ask_letter
end

printer.print_status(game)

sleep 4
printer.cls
