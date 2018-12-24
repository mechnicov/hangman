class Game
  attr_reader :word, :good_letters, :bad_letters
  attr_accessor :status, :errors
  MAX_ERRORS = 7

  def initialize(word)
    @word         = form(word)
    @errors       = 0
    @bad_letters  = []
    @good_letters = []
    @status       = :in_progress
  end

  def ask_letter
    STDOUT.puts 'Введите букву'
    letter = ''
    letter = STDIN.gets.chomp.upcase while letter == ''
    letter = 'Е' if letter == 'Ё'
    process(letter)
  end

  def in_progress?
    status == :in_progress
  end

  def win?
    status == :win
  end

  def losing?
    status == :losing
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS - errors
  end

  private

  def form(word)
    raise "Слово отсутствует. Проверьте файл 'data/words.txt'" if word.nil? || word.empty?

    word.upcase.split('').map do |letter|
      letter = 'Е' if letter == 'Ё'
      letter
    end
  end

  def process(letter)
    return if status == :losing || status == :win
    return if repeated?(letter)

    if good?(letter)
      add_letter_to(good_letters, letter)
      self.status = :win if guessed?
    else
      add_letter_to(bad_letters, letter)
      self.errors += 1
      self.status = :losing if use_all_attempts?
    end
  end

  def repeated?(letter)
    good_letters.include?(letter) || bad_letters.include?(letter)
  end

  def good?(letter)
    word.include?(letter)
  end

  def add_letter_to(list, letter)
    list << letter
  end

  def guessed?
    good_letters.sort == word.uniq.sort
  end

  def use_all_attempts?
    errors >= MAX_ERRORS
  end
end
