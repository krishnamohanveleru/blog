class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :summary
      t.string :headline
      t.text :body
      t.string :conclusion
      t.string :ticker
      t.string :friendly_id

      t.timestamps
    end
    add_index :articles, :headline
    add_index :articles, :friendly_id
  end
end
