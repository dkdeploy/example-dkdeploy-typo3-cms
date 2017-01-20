set :application, 'dkdeploy'

# Set composer default arguments, add path to composer.json
append :composer_default_arguments, '--working-dir=htdocs/'
append :composer_install_arguments, '--no-dev'

# Set file access
set :default_file_access_owner_of_release_path, 'deployment_user'
set :default_file_access_group_of_release_path, 'www-data'
set :default_file_access_owner_of_shared_path, 'deployment_user'
set :default_file_access_group_of_shared_path, 'www-data'
set :selected_custom_file_access, fetch(:asset_folders).map { |path| File.join('assets', path) }
set :custom_file_access, -> do
  {
      app: {
          release_path: {
              typo3conf: {
                  mode: 'g+w,o-rwx',
                  group: fetch(:default_file_access_group_of_release_path)
              },
              'typo3_cms_cli_dispatch.sh' => {
                  mode: 'u+rx,g+rx,u-w,g-w,o-rwx'
              }
          },
          shared_path: {
              'assets/typo3temp' => {
                  mode: 'g+w,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              },
              'assets/l10n' => {
                  mode: 'g+w,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              },
              'assets/uploads' => {
                  mode: 'g+w,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              },
              'assets/uploads/pics' => {
                  mode: 'g+w,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              },
              'assets/uploads/media' => {
                  mode: 'g+w,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              },
              'assets/fileadmin' => {
                  mode: 'g+w,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              },
              assets: {
                  mode: 'g+w,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              },
              config: {
                  mode: 'g+r,g-w,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              },
              rsa: {
                  mode: 'g+rw,o-rwx',
                  group: fetch(:default_file_access_group_of_shared_path)
              }
          }
      }
  }
end


after 'deploy:started', 'composer:local:check_status'
after 'deploy:updated', 'typo3:cms:setup_additional_configuration'

after 'deploy:published', 'typo3:cms:clear_cache'

# use typo3_console to setup TYPO3 CMS
after 'deploy:published', 'typo3:cms:update_database'
after 'deploy:published', 'typo3cms' do
  typo3_console 'extension:list'
end
after 'deploy:published', 'typo3:cms:fix_folder_structure'
