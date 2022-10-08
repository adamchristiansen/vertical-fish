# Vertical

A clean and git-aware prompt for the
[fish shell](https://github.com/fish-shell/fish-shell) with a definitive
vertical line.

Reasons why you should use Vertical:

* Features a unique vertical line prompt
* Highly configurable
* Git-aware
* Shows the status of background jobs
* Indicates when running over SSH
* Displays the duration of the previous command

This is what it looks like out of the box:

![Screenshot](.image/screenshot.png?raw=true)

## Requirements

* [fish](https://github.com/fish-shell/fish-shell) (v3.0.0 or higher)
* [git](https://git-scm.com) (optional, for git integration)

## Installation

### Using [Fisher](https://github.com/jorgebucaran/fisher)

```sh
fisher install adamchristiansen/vertical-fish
```

## Configuration

The following options can be overridden by setting the variable. This only
needs to be done once, as universal variables are used for all configuration
options.

> **Note**: The `vertical_reset_configuration` command can be used to clear all
> universal variables. They are reset to their default values the next time
> that the prompt is run. This affects only universal variables, so any set
> global variables will still be used.

**General**

| Option                  | Default                                                         | Description                          |
|-------------------------|-----------------------------------------------------------------|--------------------------------------|
| `vertical_color_normal` | `normal`                                                        | The default color.                   |
| `vertical_newline`      | `true`                                                          | Inserts a newline before the prompt. |
| `vertical_order`        | `jobs ssh user host dir git_branch git_status duration vi_mode` | Order to display components. |

**Cue**

| Option                    | Default  | Description    |
|---------------------------|----------|----------------|
| `vertical_vert_cue`       | `' '`    | The cue text.  |
| `vertical_vert_cue_color` | `normal` | The cue color. |

**Directory**

| Option                    | Default       | Description                                                 |
|---------------------------|---------------|-------------------------------------------------------------|
| `vertical_dir_color`      | `blue --bold` | The directory name color.                                   |
| `vertical_dir_prefix`     | `' '`         | The directory name prefix.                                  |
| `vertical_dir_trunc_git`  | `true`        | Shorten directory relative to the root of a git repository. |
| `vertical_dir_trunc_home` | `true`        | Replaces `$HOME` with `~`.                                  |

**Duration**

| Option                     | Default         | Description                                                                            |
|----------------------------|-----------------|----------------------------------------------------------------------------------------|
| `vertical_duration_color`  | `yellow --bold` | The duration color.                                                                    |
| `vertical_duration_min`    | `5000`          | The minimum command duration required to toggle the duration indicator (milliseconds). |
| `vertical_duration_prefix` | `' '`           | The text before the duration.                                                          |
| `vertical_duration_show`   | `true`          | Show the duration indicator.                                                           |

**Git**

| Option                              | Default          | Description                    |
|-------------------------------------|------------------|--------------------------------|
| `vertical_git_branch_color`         | `magenta --bold` | Git branch color.              |
| `vertical_git_branch_prefix`        | `' '`            | Git branch prefix.             |
| `vertical_git_show`                 | `true`           | Show git indicator.            |
| `vertical_git_status_color`         | `cyan --bold`    | Git status color.              |
| `vertical_git_status_prefix`        | `' ['`           | Git status prefix.             |
| `vertical_git_status_show`          | `true`           | Show the git status indicator. |
| `vertical_git_status_suffix`        | `]`              | Git status suffix.             |
| `vertical_git_status_sym_added`     | `+`              | Git added status symbol.       |
| `vertical_git_status_sym_ahead`     | `↑`              | Git ahead status sy            |
| `vertical_git_status_sym_behind`    | `↓`              | Git behind stymbol.            |
| `vertical_git_status_sym_diverged`  | `⇵`              | Git divstatus symbol.          |
| `vertical_git_status_sym_deleted`   | `-`              | Geted status symbol.           |
| `vertical_git_status_sym_modified`  | `!`              | Git modified status symbol.    |
| `vertical_git_status_sym_renamed`   | `»`              | Git renamed status symbol.     |
| `vertical_git_status_sym_stashed`   | `#`              | Git stashed status symbol.     |
| `vertical_git_status_sym_unmerged`  | `=`              | Git unmerged status symbol.    |
| `vertical_git_status_sym_untracked` | `?`              | Git untracked status symbol.   |

**Host**

| Option                 | Default         | Description                            |
|------------------------|-----------------|----------------------------------------|
| `vertical_host_color`  | `yellow --bold` | Host indicator color.                  |
| `vertical_host_prefix` | `@`             | Host prefix.                           |
| `vertical_host_show`   | `true`          | Show host (`true`, `false`, or `ssh`). |

**Jobs**

| Option                 | Default       | Description            |
|------------------------|---------------|------------------------|
| `vertical_jobs_color`  | `cyan --bold` | Jobs indicator color.  |
| `vertical_jobs_prefix` | `' '`         | Jobs prefix.           |
| `vertical_jobs_show`   | `true`        | Show jobs indicator.   |
| `vertical_jobs_sym`    | `'●'`         | Jobs indicator symbol. |

**SSH**

| Option                | Default       | Description           |
|-----------------------|---------------|-----------------------|
| `vertical_ssh_color`  | `cyan --bold` | SSH indicator color.  |
| `vertical_ssh_prefix` | `' '`         | SSH prefix.           |
| `vertical_ssh_show`   | `true`        | Show SSH indicator.   |
| `vertical_ssh_sym`    | `'▲'`         | SSH indicator symbol. |

**User**

| Option                 | Default         | Description                            |
|------------------------|-----------------|----------------------------------------|
| `vertical_user_color`  | `yellow --bold` | User indicator color.                  |
| `vertical_user_prefix` | `' '`           | User prefix.                           |
| `vertical_user_show`   | `true`          | Show user (`true`, `false`, or `ssh`). |

**Vertical Bar**

| Option                        | Default | Description                                       |
|-------------------------------|---------|---------------------------------------------------|
| `vertical_vert_prefix`        | `│`     | The prompt vertical bar.                          |
| `vertical_vert_color_success` | `green` | The bar color when the previous command succeeds. |
| `vertical_vert_color_failure` | `red`   | The bar color when the previos command fails.     |

**VI Mode**

| Option                             | Default         | Description                             |
|------------------------------------|-----------------|-----------------------------------------|
| `vertical_vi_mode_color`           | `yellow --bold` | VI mode color.                          |
| `vertical_vi_mode_show`            | `true`          | Show VI mode indicators.                |
| `vertical_vi_mode_sym_insert`      | `''`            | The symbol to show in insert mode.      |
| `vertical_vi_mode_sym_normal`      | `' (N)'`        | The symbol to show in normal mode.      |
| `vertical_vi_mode_sym_replace_one` | `' (R)'`        | The symbol to show in replace one mode. |
| `vertical_vi_mode_sym_visual`      | `' (V)'`        | The symbol to show in visual mode.      |
