class AddLinkText < ActiveRecord::Migration
  def change
  	add_column :projects, :link_text, :string
  end
end
