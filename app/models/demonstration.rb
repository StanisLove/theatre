# frozen_string_literal: true

class Demonstration < Sequel::Model
  many_to_one :spectacle
end
