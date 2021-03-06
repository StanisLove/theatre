# frozen_string_literal: true

class DemonstrationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :start_date, :finish_date
  belongs_to :spectacle
end
