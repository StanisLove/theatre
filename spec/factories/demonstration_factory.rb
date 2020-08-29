FactoryBot.define do
  factory(:demonstration) do
    start_date { generate(:start_date) }
    finish_date { generate(:finish_date) }
    spectacle
  end
end
