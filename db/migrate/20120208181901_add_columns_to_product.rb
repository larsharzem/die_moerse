class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :weight, :integer
    add_column :products, :brand, :string
    add_column :products, :comment, :string
    add_column :products, :productClass, :string
    add_column :products, :subject, :string
  end
end
