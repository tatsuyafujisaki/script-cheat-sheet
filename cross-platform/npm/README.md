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
sudo npm update -g

# local
npm update
```

# How to install a package adding it to `devDependencies`
```bash
# global
sudo npm install <package> -D -g

# local
npm install <package> -D 
```
* `devDependencies` is for developers and not for users.
* Packages in `devDependencies` will not be installed when a user does `npm install <package>`.

# How to uninstall a package removing it from `devDependencies`
```bash
# global
sudo npm uninstall <package> -D -g

# local
npm uninstall <package> -D
```

# How to install a scoped package
```bash
sudo npm install @scope/project
```
https://docs.npmjs.com/getting-started/scoped-packages

# How to create `package.json`
```bash
npm init -y
```

# How to run a local package
```bash
npx <package>
```

# Note
* `--save` has been the default behavior since npm 5.
  * https://blog.npmjs.org/post/161081169345/v500
* A package preceded by an @ symbol such as `@username/package` is a scoped package.
  * A scope allows you to create a package with the same name as a package created by another user or organization, which is conventionally called "Org" in Node.js, without conflict.
  * https://docs.npmjs.com/about-scopes
  * https://docs.npmjs.com/misc/scope
