class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.string :user_name
      t.text :content
      t.text :description
      t.timestamps
    end
  end
end
