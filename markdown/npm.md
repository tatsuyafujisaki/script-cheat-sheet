# How to update npm
```bash
sudo npm install npm -g
```

# How to list configurations
```bash
npm config list
```

# How to print `node_modules` folder
```bash
# global
npm root -g

# local
npm root
```

# How to list installed packages
```bash
# global
npm ls --depth 0 -g

# local
npm ls --depth 0
```

# How to update installed packages
```bash
# global
npm update -g

# local
npm update
```

# How to install a package
```bash
# global
npm install <package> -g

# local
npm install <package>
```

# How to uninstall a package
```bash
# global
npm uninstall <package> -g

# local
npm uninstall <package>
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
