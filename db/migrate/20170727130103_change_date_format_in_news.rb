class ChangeDateFormatInNews < ActiveRecord::Migration[5.1]
  def up
   change_column :news, :date, :datetime
  end

  def down
   change_column :news, :date, :date
  end
end
