#!/bin/bash

rails db:create
rails db:migrate
#rails db:seed_fu
#bundle exec shoryuken -C config/shoryuken.yml --rails -d -L ./log/shoryuken.log
rails server -b 0.0.0.0