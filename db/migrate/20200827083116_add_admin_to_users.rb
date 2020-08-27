class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    # defaultの指定によりデフォルトでは管理者になれないということを示すための指定しています
  end
end
