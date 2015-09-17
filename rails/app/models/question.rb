require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

class Question < ActiveRecord::Base
  include Bootsy::Container
  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    convert_numbers(answer.squish.downcase) == convert_numbers(submission.squish.downcase)
  end

  def convert_numbers(answer)
  	answer.match(/^-?\d+$/) ? Integer(answer).in_words : answer
  end

end
