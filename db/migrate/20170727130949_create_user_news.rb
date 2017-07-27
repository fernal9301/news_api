class CreateUserNews < ActiveRecord::Migration[5.1]
  def change
    create_table :user_news do |t|
      t.integer :user_id
      t.integer :news_id

      t.timestamps
    end
  end
end
