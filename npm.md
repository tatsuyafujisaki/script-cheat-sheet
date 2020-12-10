# How to upgrade npm
```bash
npm install npm -g
```

# How to upgrade node
```bash
npm install node -g
```

# How to list configurations
```bash
npm config list
```

# How to show `node_modules` folder
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

# How to install a package locally and add it to `devDependencies`
```bash
npm install <package> --save-dev 
```
* `devDependencies` is for developers and not for users.
* Packages in `devDependencies` will not be installed when users do `npm install <package>`.
* You cannot install a package globally and add it to `devDependencies`

# How to uninstall a global package
```bash
npm uninstall <package> -g
```

# How to uninstall a local package and remove it from `devDependencies`
```bash
npm uninstall <package> --save-dev
```

# How to install a scoped package
```bash
npm install @scope/project
```
* A package preceded by an @ symbol such as `@username/package` is a scoped package.
  * A scope lets you create a package with the same name as a package created by another user or organization, which is conventionally called "Org" in Node.js, without conflict.
  * https://docs.npmjs.com/about-scopes
  * https://docs.npmjs.com/misc/scope

# How to create `package.json`
```bash
npm init -y
```

# How to run an executable in a local package
```bash
npx <executable> # e.g. npx tsc foo.ts
```

> Tip: If you are using npm 5.2 or higher, we recommend using npx to run packages globally.
https://docs.npmjs.com/downloading-and-installing-packages-globally

# How to work with ESLint in Visual Studio Code
1. `npm init -y`
2. `npm install eslint eslint-config-google --save-dev`
3. `code .`

# How to work with Puppeteer in Visual Studio Code
1. `npm init -y`
2. `npm install eslint eslint-config-google puppeteer --save-dev`
3. `code .`

# Note
* `--save` has been the default behavior since npm 5.
  * https://blog.npmjs.org/post/161081169345/v500
