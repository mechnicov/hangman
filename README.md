## Hangman

### Description

Console game, implemented in Ruby.

Language: Russian.

Basic rules – see at [Wikipedia](https://en.wikipedia.org/wiki/Hangman_(game)).

The game has 2 modes (random word from dictionary or user input).

The user is given 7 attempts to guess the word.

### Launching

1. Download repo to your local directory. If your Ruby version is 2.4 or higher – go to Item 4.

2. Comment out lines in `hangman.rb` and `add_words.rb`

```rb
require 'unicode_utils'
```

3. Comment out line in `Gemfile`

```rb
gem 'unicode_utils'
```

4. Use bundler

```
$ bundle install
```

5. Type to run

```
$ bundle exec ruby hangman.rb
```

### Changing dictionary

To add new words run

```console
$ bundle exec ruby add_words.rb
```

You can also do this manually by changing `data/words.txt`, each word should be on a separate line, blank lines should be missing.

### License

MIT – see `LICENSE`

### Contacts

Email me at

```rb
'dcdl-snotynu?fl`hk-bnl'.each_char.map(&:succ).join
```
