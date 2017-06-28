require_relative 'Scrabble'
require 'tty'
require 'pry'


prompt = TTY::Prompt.new
choice01 = "Score word"
choice02 = "score word with scrabble grid multipliers"
decision = prompt.select("Choose game mode", choice01, choice02)
binding.pry

