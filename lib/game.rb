# Класс, отвечающий за логику игры
class Game
  attr_reader :letters, :good_letters, :bad_letters, :status, :errors

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @bad_letters = []
    @good_letters = []
    @status = 0
  end

  def ask_letter
    STDOUT.puts 'Введите букву'
    letter = ''
    letter = STDIN.gets.chomp.upcase while letter == ''
    letter = 'Е' if letter == 'Ё'
    letter = 'И' if letter == 'Й'
    check(letter)
  end

  private

  # Формируем слово
  def get_letters(slovo)
    raise "Слово отсутствует. Проверьте файл 'data/words.txt'" if slovo.nil? || slovo.empty?

    slovo = slovo.upcase.split('').collect! do |letter|
      if letter == 'Ё'
        'Е'
      elsif letter == 'Й'
        'И'
      else
        letter
      end
    end
    slovo
  end

  # Проверяем букву
  def check(bukva)
    return if @status == -1 || @status == 1
    return if @good_letters.include?(bukva) || @bad_letters.include?(bukva)

    if @letters.include? bukva
      @good_letters << bukva
      @status = 1 if @good_letters.sort == @letters.uniq.sort
    else
      @bad_letters << bukva
      @errors += 1
      @status = -1 if @errors >= 7
    end
  end
end
