class AddHeadingToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :heading, :string
    
  end
end
