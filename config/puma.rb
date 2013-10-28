pidfile "/tmp/puma/home_vagrant_apps_efile.pid"
state_path "/tmp/puma/home_vagrant_apps_efile.state"
bind 'tcp://127.0.0.1:9292'
activate_control_app

threads 3, 10
