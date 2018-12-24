class ResultPrinter
  def initialize(game)
    @current_path = __dir__
    @status_image = (0..game.max_errors).map do |counter|
      image_path = @current_path + "/../data/images/#{counter}.txt"
      begin
        File.read(image_path)
      rescue SystemCallError
        "\n" * 11 + '[ Изображение не найдено ]' + "\n" * 12
      end
    end
  end

  def print_status(game)
    cls
    STDOUT.puts "\nСлово: #{word_on_board(game.word, game.good_letters)}"
    STDOUT.puts "Ошибки (#{game.errors}): #{game.bad_letters.join(', ')}"

    print_viselica(game.errors)

    if game.losing?
      STDOUT.puts "Вы проиграли, загадано было #{game.word.join('')}\n\n"
    elsif game.win?
      STDOUT.puts "Поздравляем, Вы выиграли!\n\n"
    else
      STDOUT.puts "Осталось попыток: #{game.errors_left}"
    end
  end

  def cls
    system 'clear'
  end

  def intro
    begin
      intro = File.read(@current_path + '/../data/intro.txt')
      STDOUT.puts "\n" * 10, intro
    rescue SystemCallError
      STDOUT.puts "\n" * 10, 'Виселица'
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
    STDOUT.puts @status_image[errors]
  end
end
