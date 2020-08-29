FactoryBot.define do
  factory(:demonstration) do
    spectacle

    transient do
      from { nil }
      to   { nil }
    end

    after(:build) do |demo, evaluator|
      if evaluator.from && evaluator.to
        demo.dates = "[#{evaluator.from}, #{evaluator.to}]"
      end
    end
  end
end
