bundle install
git add --all; git ci -m'bundle install'

rails webpacker:install
git add --all; git ci -m'rails webpacker:install'

rails webpacker:install:react
git add --all; git ci -m'rails webpacker:install:react'

rails generate react:install
git add --all; git ci -m'rails generate react:install'

