Hanami::Model.migration do
  change do
    create_table :memos do
      primary_key :id
      column :body,       "text",  null: false
    end
  end
end
