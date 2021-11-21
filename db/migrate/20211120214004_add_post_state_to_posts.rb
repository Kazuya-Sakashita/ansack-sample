class AddPostStateToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_state, :string
  end
end
