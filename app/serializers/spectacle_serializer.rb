# frozen_string_literal: true

class SpectacleSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :description
end
