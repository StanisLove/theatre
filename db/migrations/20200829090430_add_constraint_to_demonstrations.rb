Sequel.migration do
  up do
    run(<<-SQL)
      ALTER TABLE demonstrations ADD CONSTRAINT demonstrations_dates_excl
      EXCLUDE USING gist (daterange(start, finish, '[]') WITH &&)
    SQL
  end

  down do
    run(<<-SQL)
      ALTER TABLE demonstrations DROP CONSTRAINT demonstrations_dates_excl
    SQL
  end
end
