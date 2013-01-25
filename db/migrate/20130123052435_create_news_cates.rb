class CreateNewsCates < ActiveRecord::Migration
  def change
    create_table :news_cates do |t|
      t.string :news_iconurl
      t.string :news_catename
      t.text :new_catedesc

      t.timestamps
    end
  end
end
