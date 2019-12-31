# How to launch Chrome from Terminal on macOS using basic access authentication.

```bash
open -a 'Google Chrome' https://username:password@example.com/foo/
```

## Note
* Since Chrome 59, URLs with an embedded credential for subresources (e.g. `https://username:password@example.com/foo/` or `https://username:password@example.com/bar.jpg`) have been unavailable while URLs with an embedded credential for main resources (e.g. `https://username:password@example.com`) are still available. But still, URLs with an embedded credential for subresources are available if launched from Terminal.
  * https://www.chromestatus.com/feature/5669008342777856
