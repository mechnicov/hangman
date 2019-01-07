require 'game'

describe Game do
  let (:game) { Game.new('ёжики') }
  let (:win_combo) { %w(Е Ж И К) }
  let (:losing_combo) { %w(Л М Н О П Р С) }

  it 'user should win the game' do
    expect(game.status).to eq :in_progress
    win_combo.each { |letter| game.instance_eval { process(letter) } }
    expect(game.errors).to eq 0
    expect(game.status).to eq :win
  end

  it 'user should lose the game' do
    losing_combo.each { |letter| game.instance_eval { process(letter) } }
    expect(game.errors).to eq 7
    expect(game.status).to eq :losing
  end
end
