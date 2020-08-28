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
      spectacles.each do |spectacle|
        db[:spectacles].insert_conflict.insert(
          **spectacle, created_at: Time.now, updated_at: Time.now
        )
      end
    end

    puts 'ok'
  end
end
