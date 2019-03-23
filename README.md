# gitlab-ci-mode-flycheck

[![pipeline status](https://gitlab.com/joewreschnig/gitlab-ci-mode-flycheck/badges/master/pipeline.svg)](https://gitlab.com/joewreschnig/gitlab-ci-mode-flycheck/commits/master) [![MELPA Stable](https://stable.melpa.org/packages/gitlab-ci-mode-flycheck-badge.svg)](https://stable.melpa.org/#/gitlab-ci-mode-flycheck) [![MELPA](https://melpa.org/packages/gitlab-ci-mode-flycheck-badge.svg)](https://melpa.org/#/gitlab-ci-mode-flycheck)


`gitlab-ci-mode-flycheck` provides [Flycheck][] integration for the
linter included with [`gitlab-ci-mode`][gitlab-ci-mode].

For security reasons this checker is not enabled by default, as the
linter works by sending your GitLab CI configuration to a remote server.
To enable it, call `gitlab-ci-mode-flycheck-enable`.

A recommended deferred [use-package][] stanza is:

```elisp
(use-package gitlab-ci-mode-flycheck
  :after flycheck gitlab-ci-mode
  :init
  (gitlab-ci-mode-flycheck-enable))
```


[Flycheck]: http://www.flycheck.org/
[gitlab-ci-mode]: https://gitlab.com/joewreschnig/gitlab-ci-mod
[use-package]: https://github.com/jwiegley/use-package


## License

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your
option) any later version.
