Hanami::Model.migration do
  change do
    create_table :spaces do
      primary_key :id
      column :user, String, null: false
      column :type, String, null: false
    end
  end
end
