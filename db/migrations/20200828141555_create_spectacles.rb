Sequel.migration do
  change do
    create_table(:spectacles) do
      primary_key :id, type: :Bignum

      column :title,       String, unique: true, null: false
      column :description, String, text: true
      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false
    end
  end
end
