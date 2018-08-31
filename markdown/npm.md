# How to list configurations
```bash
npm config list
```

# How to print`node_modules` folder
```bash
npm root
npm root -g
```

# How to list packages
```bash
# Bash
npm ls --depth 0 2> /dev/null
npm ls --depth 0 -g 2> /dev/null

# Windows Command Prompt
npm ls --depth 0 2> nul
npm ls --depth 0 -g 2> nul
```

# How to update npm itself
```bash
npm install npm -g
```

# How to update global packages
```bash
npm update
npm update -g
```

# How to install a package
```bash
npm install <package>
npm install <package> -g
```

# How to uninstall a package
```bash
npm uninstall <package>
npm uninstall <package> -g
```

# How to install a scoped package
```bash
npm install @scope/project
```
https://docs.npmjs.com/getting-started/scoped-packages

# How to run a local package
```bash
npx <package>
```

# Comparison between local and global

Operation|Locally|Globally
---|---|---
Print packages|npm ls|npm ls -g
Create `package.json`|npm init -y|(n/a)
Install a package|npm install \<package> --no-save|sudo npm install \<package> -g
Run a local package|npx \<package>|(n/a)
Install local packages in all types of dependencies in `package.json`|npm install|(n/a)
Install local packages in all types of dependencies except `devDependencies` in `package.json`|npm install --production|(n/a)
Install a local package adding it to `dependencies` in `package.json`|npm install <package>|(n/a)
Install a local package adding it to `devDependencies` in `package.json`|npm install <package> --save-dev|(n/a)
Uninstall a local package removing it from `dependencies` in `package.json`|npm uninstall \<package>|(n/a)
Uninstall a local package removing it from `devDependencies` in `package.json`|npm uninstall \<package> --save-dev|(n/a)