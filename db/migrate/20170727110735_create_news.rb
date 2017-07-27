class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.datetime :date
      t.string :title
      t.text :content
      t.text :sources

      t.timestamps
    end
  end
end
