class AddPolyMorphismToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :sitter_comments, :commentable_id, :integer
    add_column :sitter_comments, :commentable_type, :string

    remove_column :sitter_comments, :sitter_id, :integer
  end
end
