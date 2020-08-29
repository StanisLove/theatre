# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:demonstrations) do
      primary_key :id, type: :Bignum
      foreign_key :spectacle_id, :spectacles, null: false, index: true, on_delete: :cascade

      column :start_date,    Date, null: false
      column :finish_date,   Date, null: false
      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false
    end
  end
end
