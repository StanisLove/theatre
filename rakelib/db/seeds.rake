namespace :db do
  desc "Seed database with data"
  task :seeds => :settings do
    require 'sequel/core'

    spectacles = [
      { title: "Три сестры", description: "Роль трёх сестёр играют три брата" },
      { title: "На дне", description: "Снизу вам обязательно постучат" },
      { title: "Горе от ума", description: "Карету мне! Карету!" }
    ]

    Sequel.connect(Settings.db.to_hash) do |db|
      # Create spectacles
      spectacles.each do |spectacle|
        db[:spectacles].insert_conflict.insert(
          **spectacle, created_at: Time.now, updated_at: Time.now
        )
      end

      # Create demonstrations
      db[:spectacles].select(Sequel[:id].as(:spectacle_id)).all.zip([
        { dates: '[2020-09-01, 2020-09-10]' },
        { dates: '[2020-09-11, 2020-09-15]' },
        { dates: '[2020-09-21, 2020-09-30]' },
      ]).map { |arr| arr.reduce(&:merge) }.each do |demo|
        db[:demonstrations].insert_conflict.insert(
          **demo, created_at: Time.now, updated_at: Time.now
        )
      end

      # Check gist index
      puts db[:demonstrations].where(Sequel.lit("dates @> '2020-09-23'::date")).explain
    end

    puts 'ok'
  end
end
