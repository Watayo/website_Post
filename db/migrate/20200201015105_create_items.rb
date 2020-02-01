class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user
      t.text :title
      t.text :user_name
      t.text :content
      t.text :description
      t.timestamps null: false
    end
  end
end
