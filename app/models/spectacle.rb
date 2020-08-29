# frozen_string_literal: true

class Spectacle < Sequel::Model
  one_to_many :demonstrations
end
