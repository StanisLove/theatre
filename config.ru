# frozen_string_literal: true

require_relative 'config/environment'

map '/theatre/v1' do
  run SpectacleRoutes
end
