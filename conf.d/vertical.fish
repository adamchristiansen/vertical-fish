set -g vertical_version 1.0.1

function __vertical_install --on-event vertical_install
  # Nothing to do
end

function __vertical_update --on-event vertical_update
  # Nothing to do
end

function __vertical_uninstall --on-event vertical_uninstall
  vertical_clear_configuration
  set -eg vertical_version
end
