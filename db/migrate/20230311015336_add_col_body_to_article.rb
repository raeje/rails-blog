class AddColBodyToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :body, :text
  end
end
