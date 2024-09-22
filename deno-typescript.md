# How to bulk rename files using indexes in the current directory

```ts
import { walkSync } from "jsr:@std/fs/walk";

Array.from(
  walkSync(Deno.cwd(), { maxDepth: 1, includeDirs: false, exts: [".JPG"] }),
)
  .forEach((entry, index) => {
    Deno.renameSync(entry.path, `xxx-${index + 1}-yyyy-mm-dd.jpg`);
  });
```
