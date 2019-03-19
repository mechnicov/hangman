class Printer
  def initialize(game)
    @status_image = (0..game.max_errors).map do |counter|
      image_path = "#{__dir__}/../data/images/#{counter}.txt"
      begin
        File.read(image_path)
      rescue SystemCallError
        "\n" * 11 + '[ Изображение не найдено ]' + "\n" * 12
      end
    end
  end

  def print_status(game)
    cls
    puts "\nСлово: #{word_on_board(game.word, game.good_letters)}".colorize(:light_green)
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(', ')}".colorize(:light_red)

    print_viselica(game.errors)

    if game.losing?
      puts "Вы проиграли, загадано было #{game.word.join('')}\n\n".colorize(:light_red).blink
    elsif game.win?
      puts "Поздравляем, Вы выиграли!\n\n".colorize(:light_green).blink
    else
      puts "Осталось попыток: #{game.errors_left}".colorize(:light_red)
    end
  end

  def cls
    system 'clear'
  end

  def intro
    begin
      intro = File.read("#{__dir__}/../data/intro.txt")
      puts "\n" * 10, intro.white.on_blue
    rescue SystemCallError
      puts "\n" * 10, 'Виселица'.colorize(:blue)
    end
  end

  private

  def word_on_board(word, good_letters)
    result = ''
    word.each do |letter|
      result += if good_letters.include?(letter)
                  letter + ' '
                else
                  '_ '
                end
    end
    result
  end

  def print_viselica(errors)
    puts @status_image[errors].colorize(:blue)
  end
end
