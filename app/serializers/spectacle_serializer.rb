class SpectacleSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :description
end
