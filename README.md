# profile.d-direnv

A plugin for [profile.d](https://github.com/jakubro/profile.d) that integrates [direnv](https://direnv.net/) - a
powerful environment switcher for the shell that loads and unloads environment variables depending on the current
directory.

## Features

- Automatically installs and configures direnv
- Provides enhanced direnv functionality with additional commands:
    - `use node` - Manages Node.js environments using nvm
    - `use python` - Manages Python environments using pyenv
    - `use dotenv` - Loads environment variables from .env files
    - `use aws_secret_env` - Loads environment variables from AWS Secrets Manager
    - `use default` - Provides default directory configuration
- Includes smart dependency management for Node.js and Python projects
- Offers detailed logging and debugging capabilities
- Supports automatic environment switching when changing directories

## Installation

1. Add the following line to your `~/.profiledrc`:

```bash
PLUGINS=(
  # ... your other plugins ...
  https://github.com/jakubro/profile.d-direnv
)
```

2. Run the installation commands:

```bash
profile.d-install
. ~/.bashrc
```

## Usage

### Basic Usage

Create a `.envrc` file in your project directory and use any of the provided commands. For example:

```bash
# .envrc
use node 18
use python 3.11.5
use dotenv
```

Then allow the direnv configuration:

```bash
direnv allow
```

### Available Commands

#### Node.js Environment

```bash
# Use specific Node.js version
use node 18

# Use Node.js version from .nvmrc with custom root directory
use node --root=./src
```

#### Python Environment

```bash
# Use specific Python version
use python 3.11.5

# Additional options
use python --upgrade-pip
use python --write-requirements
use python --root=./src
```

#### Environment Variables

```bash
# Load from .env file
use dotenv

# Load from specific file
use dotenv .env.local

# Load without overwriting existing variables
use dotenv --no-overwrite

# Load from AWS Secrets Manager
use aws_secret_env production/mysql
use aws_secret_env staging/redis --profile=staging --region=us-east-1
```

#### Default Configuration

```bash
# Load parent .envrc files and private configurations
use default

# Load as root configuration
use default root
```

## How It Works

The plugin:

1. Installs direnv during the installation phase
2. Sets up shell hooks for automatic environment loading/unloading
3. Provides enhanced direnv functionality through custom commands
4. Manages development environments and dependencies automatically
5. Handles environment variables from various sources (files, AWS, etc.)

## Requirements

- Git (automatically installed by profile.d if missing)
- Bash
- Additional requirements depending on usage:
    - Node.js features require nvm
    - Python features require pyenv
    - AWS features require AWS CLI

## Contributing

If you would like to contribute to this project, please feel free to submit a pull request or open an issue for
discussion.

## License

MIT License - see the [LICENSE](LICENSE) file for details.
