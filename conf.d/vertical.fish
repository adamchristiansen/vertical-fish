function __vertical_install --on-event vertical_install
  # Nothing to do
end

function __vertical_update --on-event vertical_update
  # Nothing to do
end

function __vertical_uninstall --on-event vertical_uninstall
  vertical_clear_configuration
end
