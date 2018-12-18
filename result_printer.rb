class ResultPrinter
  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0
    while counter <= 7
      image_path = current_path + "/image/#{counter}.txt"
      begin
        f = File.new(image_path)
        @status_image << f.read
        f.close
      rescue SystemCallError
        @status_image << "\n" * 11 + "[ Изображение не найдено ]" + "\n" * 12
      end
      counter += 1
    end
  end

  # выводим данные (слово, ошибки, плохие и хороши буквы)
  def print_status(game)
    cls
    STDOUT.puts "\nСлово: #{get_word_for_print(game.letters, game.good_letters)}"
    STDOUT.puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselica(game.errors)

    if game.status == -1
      STDOUT.puts "Вы проиграли, загадано было #{game.letters.join("")}\n\n"
    elsif game.status == 1
      STDOUT.puts "Поздравляем, Вы выиграли!\n\n"
    else
      STDOUT.puts "У Вас осталось #{7 - game.errors} попыток"
    end
  end

  # очищаем экран
  def cls
    system "clear"
  end

  private

    def get_word_for_print(letters, good_letters)
      result = ""
      letters.each do |letter|
        if good_letters.include?(letter)
          result += letter + " "
        else
          result += "__ "
        end
      end
      result
    end

    def print_viselica(oshibki)
      STDOUT.puts @status_image[oshibki]
    end
end
